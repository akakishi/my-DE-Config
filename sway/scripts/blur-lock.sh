#!/usr/bin/env bash

swaylock \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 20 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--inside-color 00000080 \
	--inside-clear-color 00000080 \
	--inside-ver-color 00000080 \
	--inside-wrong-color 00000080 \
	--key-hl-color "89b4fa" \
	--bs-hl-color "b4befe" \
	--ring-color "1e1e2e" \
	--ring-clear-color "a6e3a1" \
	--ring-wrong-color "f38ba8" \
	--ring-ver-color "fab387" \
	--line-uses-ring \
	--line-color 00000080 \
	--font 'FiraCode Nerd Font:style=Thin,Regular 40' \
	--text-color "f2cdcd" \
	--text-clear-color "f2cdcd" \
	--text-wrong-color "f2cdcd" \
	--text-ver-color "f2cdcd" \
	--separator-color 00000080 \
	--grace 2 \
	--fade-in 0.2

	#--image "$HOME/jwst-desktop-01.jpg" \
	#--daemonize
