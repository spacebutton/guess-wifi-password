#!/usr/bin/bash
# Name: Guess-wifi-password.sh
# Date: Thu Feb 16 22:39:46 WIB 2023
# Copyright (c) 2023 t.me/space_button
# License MIT

# latest Tuesday, October 21, 2023 at 04:40
#+ Add c wordlist
#+ Change Algorithm to modular
#+ Add new file "gwp_interactive.sh"

: " Last Update: 20 February 2024"
#+ Coditional dynamic
#+ Fix bug

#  set -xv #unhash this for debug

# Algorithm: dynamic-condition-response using "while getopts do and case esac"
source ./gwp-wordlist.txt

declare -a scriptn=("$(basename $0)" "$(dirname $0)")
declare -A version=([simple]='104' [detail]='v1.0.4-stable' [default]='1.0.4')
if [ "$0" == "${scriptn[0]}" ]; then
filename="bash $0"
else
filename="$0"
fi

function usage
{
echo
echo -e "Usage:  ${scriptn[0]} OPTION {a..z}"
echo -e "        ${filename} -l {a..z}"
echo -e ""
echo -e " Availabe opt. or wordlist\n
\t-$GWP_WORDLIST will generate suffix l as double
\t-${GWP_WORDLIST[2]} will generate suffix n as double
\t-${GWP_WORDLIST[1]} will generate suffix m as double

or see ./gwp-wordlist.txt for more\n"
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
echo 
# DYNAMIC COMDITIONAL CODED BY AUTHOR
while getopts "$(echo ${GWP_WORDLIST[@]} | tr ' ' ':')" flag
 do
   case "${flag}" in
  *) 
    if [ "$flag" == "?" ]; then
       echo "error: wordlist tidak terdaftar atau syntax salah!"
       echo "$(usage)"
       #echo "penulisan yang benar \`$0 -$flag$flag'" 
       exit 1;
    fi     
   declare double="$OPTARG${OPTARG}"; # : "deprecrated variable"
   declare validWordList="$flag${flag}"
   declare getRandom=$(echo "$(cons_rand)$(voc_rand)${validWordList}");
   echo "$getRandom${getRandom}";
   exit 0;;
	esac
done
echo -e "Version: ${version[detail]}"
echo -e "Try ${filename} --help" # walaupun flag -- tidak dideklarasikan pada kode, mohon jangan edit bagian ini wajib pakai flag -- untuk membedakan dengan syntax wordlist yaitu - agar konsisten
exit 1
