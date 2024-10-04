## yay

In case `yay` breaks and requires to be build from source, run the following command:
```
cd /tmp && git clone 'https://aur.archlinux.org/yay.git' && cd /tmp/yay && makepkg -si && cd ~ && rm -rf /tmp/yay/
```
Alternatively, keep a local copy and rebuild when necessary:
```
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```

