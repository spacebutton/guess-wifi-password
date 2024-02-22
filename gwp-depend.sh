#!/bin/sh
PACKAGES=""

PACKAGES+=" grep"				
PACKAGES+=" fzf"	 
PACKAGES+=" pv"
PACKAGES+=" coreutils" # gwp need these command fold, shuf, tr, sort, basename, dirname
PACKAGES+=" sed"
apt update
apt dist-upgrade -y
apt install -y $PACKAGES
