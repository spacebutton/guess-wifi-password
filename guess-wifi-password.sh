#!/usr/bin/bash
# Name: Guess-wifi-password.sh
# Date: Thu Feb 16 22:39:46 WIB 2023
# Copyright (c) 2023 t.me/space_button a.k.a luisadha
# License MIT

#  set -xv #unhash this for debug

declare -a scriptn=("$(basename $0)" "$(dirname $0)")
declare -A version=([simple]='100' [detail]='v1.0.0' [default]='1.0.0')
if [ "$0" == "${scriptn[0]}" ]; then
filename="bash $0"
else
filename="$0"
fi
usage() {
echo
echo -e "Usage:  ${scriptn[0]} OPTION {a..z}"
echo -e "        ${filename} -l {a..z}"
echo -e ""
echo -e " Availabe opt. or wordlist\n
\t-l will generate suffix l as double
\t-n will generate suffix n as double\n\t-m will generate suffix m as double\n"
echo -e " Script to guess password wifi as random with PATTERN\nPrefix as CONSONAN, Midle as VOCAL and Suffix as DOUBLE WORDLIST (see: opt).\n"
echo "[ Brought to you @space_button ]"
}

function cons_rand
{
local consonan=("b" "c" "d" "f" "g" "h" "j" "k" "l" "m" "n" "p" "q" "r" "s" "t"  "v" "w" "x" "y" "z" )

  for i in ${consonan[@]};
  do
    echo "$i"
  done | fold -w1 | shuf -n1 | sed 's/ //g'

}
function voc_rand
{
local vocal=("a" "e" "i" "u" "o")
   for j in ${vocal[@]};
     do
	echo "$j"
   done | fold -w1 | shuf -n1 | sed 's/ //g'
}

while getopts ":h:l:m:n:" flag
 do
	case "$flag" in
	h) echo "$(usage)"; exit 0;;
	l) declare ll=$(echo "$(cons_rand)$(voc_rand)${13}l")
	        echo "$ll${ll}"; exit 0;;
	m) declare mm=$(echo "$(cons_rand)$(voc_rand)${14}m")
	        echo "$mm${mm}"; exit 0;;
	n) declare nn=$(echo "$(cons_rand)$(voc_rand)${15}n")
		echo "$nn${nn}"; exit 0;;
	?) echo "$0: options not recognized! or require more arguments after -$OPTARG"; exit 1;;
	esac
done
echo -e "Version: ${version[detail]}"
echo -e "Try ${filename} -help"
exit 0
