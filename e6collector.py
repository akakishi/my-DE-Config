#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
e6collector

Very simple Python 3.6 script that will download all images with a specific
tag, save them named ID-SOME-TAGS.EXTENSION and makes sure it doesn't
download the same image multiple times because the tags changed. Also
all tags will be written to tags.csv in the same folder. Using the
e621 2020 API described on https://e621.net/help/api

PROTIP: To view images with a certain tag try this on UNIX-like systems:
gthumb `for f in $(grep -i TAG tags.csv | cut -f 1 -d ","); do echo $f-*; done`

THE AUTHOR DOES NOT TAKE ANY RESPONSIBILITIES, THERE IS NO WARRANTY AND
YOU PROBABLY SHOULDN'T USE THIS IN A NUCLEAR POWER PLANT, JUST SAYING!

License: Public domain, do whatever.

Version 1.0 -- Initial release, if you can call it that
Version 1.0.1 -- Fixed Unicode problem on Windows
Version 1.0.2 -- Fixed API not working
Version 2.0 -- Ported to new 2020 API, added rate limiting
Version 2.1 -- Handle restricted images by allowing API key usage or skipping
"""
import argparse
import base64
import csv
import glob
import json
import time
import os.path
from collections import namedtuple
from urllib.request import urlopen, Request

BASEURL = 'https://e621.net'
LISTURL = BASEURL + '/posts.json?limit=320&page={0:d}&tags={1:s}'
FNAME = '{0:d}-{1:s}.{2:s}'
KEEPCHARS = ['_', '-']  # For tag mangling
destination = None

lastrequest = 0 # UNIX time stamp of last request
hdr = {'User-Agent': 'e6collector/2.1 (by stealthmode)'}
Post = namedtuple("Post", ['id', 'deleted', 'tags', 'ext', 'url',
                           'sources'])

# Simple delay for adhering to 1 per second rate limit outlined in API doc
def speedlimit():
    global lastrequest
    while lastrequest + 1 > time.time():
        print('Zzzz')
        time.sleep(0.2)
    lastrequest = time.time()

# Add HTTP basic auth headers manually. does not work via urllib handler
# because the server never asks since it's optional
def login(user, key):
    global hdr
    if user is not None and key is not None:
        print('Using API key')
        credentials = '{0:s}:{1:s}'.format(user, key)
        b64credentials = base64.b64encode(str.encode(credentials)).decode()
        hdr['Authorization'] = 'Basic {0:s}'.format(b64credentials)

def readlist(query):
    page = 1 # Starting to count from 1, how strange
    posts = []
    
    while True:  # Ick
        # Some error handling would be nice, this will bug out if e6 is slow.
        print('Now fetching page {}'.format(page))
        with urlopen(Request(LISTURL.format(page, query), headers=hdr)) as req:
            jsondata = json.load(req)
            if not 'posts' in jsondata:
                raise KeyError('posts array not found in JSON data')
                exit(1)
            if len(jsondata['posts']) == 0:
                print('Done reading list')
                break
            for post in jsondata['posts']:
                # Flatten post tags into single set
                tags = set()
                try:
                    for category in post['tags']:
                        if not isinstance(post['tags'][category], list):
                            continue
                        tags = tags.union(post['tags'][category])
                except KeyError as e:
                    raise # XXX
                tags = sorted(tags)

                try:
                    posts.append(Post(post['id'],
                         post['flags']['deleted'],
                         tags,
                         post['file']['ext'],
                         post['file']['url'],
                         post['sources']))
                except KeyError as e:
                    raise # XXX

            page += 1
            speedlimit()
    return(posts)

def writetags(post_id, source, tags):
    if source is None:
        source = ""
    fullpath = os.path.join(destination, 'tags.csv')
    with open(fullpath, 'a', encoding='utf-8') as tagfile:
        writer = csv.writer(tagfile, quoting=csv.QUOTE_MINIMAL)
        row = [post_id, source]
        row.extend(tags)
        writer.writerow(row)

def mirror(tags):
    posts = readlist(tags)
    downloaded = 0
    for post in posts:
        if post.deleted:
            print('{0:d} was deleted'.format(post.id))
            continue
        if len(glob.glob(os.path.join(destination, '{0:d}-*'.format(post.id)))) > 0:
            print('{0:d} already exists'.format(post.id))
            continue
        if post.url is None:
            print('{0:d} could not be downloaded, you might have to log in'.format(post.id))
            continue
        speedlimit()
        with urlopen(Request(post.url, headers=hdr)) as request:
            downloaded += 1
            print('{0:d} is being downloaded and saved...'.format(post.id))
            imgdata = request.read()
            
            # Make tags safe for file name usage. Still unelegant as fuck.
            fname_tags = []
            for tag in post.tags:
                mangled_tag = ''
                for chara in tag:
                    if chara.isalnum() or chara in KEEPCHARS:
                        mangled_tag += chara
                    else:
                        print('Bad char?', ord(chara))
                if len(mangled_tag) > 0:
                    fname_tags.append(mangled_tag)

            fname = FNAME.format(post.id, '-'.join(fname_tags)[:190], post.ext)
            fullpath = os.path.join(destination, fname)
            with open(fullpath.encode('utf-8'), 'wb') as imgfile:
                imgfile.write(imgdata)
                writetags(post.id, post.sources, post.tags)

    print('Finished collecting {0:d} posts'.format(len(posts)))
    print('{0:d} were newly downloaded'.format(downloaded))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Download files by tag from e621')
    parser.add_argument('destination', help='Directory to store the files in', nargs='?')
    parser.add_argument('tags', help='Tags to look for. Must be URL encoded already. Try "fav:yourname"', nargs='?')
    parser.add_argument('user', help='User account to use with API key', default=None, nargs='?')
    parser.add_argument('key', help='API key, needed for some downloads', default=None, nargs='?')
    args = parser.parse_args()
    if args.tags is None:
        parser.print_help()
        exit (1)
    destination = args.destination
    login(args.user, args.key)
    mirror(args.tags)
