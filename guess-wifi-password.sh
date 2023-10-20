#!/usr/bin/bash
# Name: Guess-wifi-password.sh
# Date: Thu Feb 16 22:39:46 WIB 2023
# Copyright (c) 2023 t.me/space_button
# License MIT

# latest Tuesday, October 10, 2023 at 18:09
#+ Add v wordlist


#  set -xv #unhash this for debug
source ./gwp-wordlist.txt

declare -a scriptn=("$(basename $0)" "$(dirname $0)")
declare -A version=([simple]='102' [detail]='v1.0.2' [default]='1.0.2')
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
# index start from l = 0 not a = 0

while getopts ":${GWP_WORDLIST[0]}:${GWP_WORDLIST[1]}:${GWP_WORDLIST[2]}:${GWP_WORDLIST[3]}:" flag
  # Add yours arrays value if any
 do
	case "$flag" in

	${GWP_WORDLIST[0]}) declare ${GWP_WORDLIST[0]}l=$(echo "$(cons_rand)$(voc_rand)${13:-$OPTARG}l")
	        echo "$ll${ll}"; exit 0;;
	${GWP_WORDLIST[1]}) declare ${GWP_WORDLIST[1]}m=$(echo "$(cons_rand)$(voc_rand)${14:-$OPTARG}m")
	        echo "$mm${mm}"; exit 0;;
	${GWP_WORDLIST[2]}) declare ${GWP_WORDLIST[2]}n=$(echo "$(cons_rand)$(voc_rand)${15:-$OPTARG}n")
		echo "$nn${nn}"; exit 0;;
        ${GWP_WORDLIST[3]}) declare ${GWP_WORDLIST[3]}v=$(echo "$(cons_rand)$(voc_rand)${23:-$OPTARG}v")
                echo "$vv${vv}"; exit 0;;
              ## Add here yours option 
	?) echo "$0: options not recognized! or require more arguments after -$OPTARG";
    echo "$(usage)"; exit 1;;
	esac
done
echo -e "Version: ${version[detail]}"
echo -e "Try ${filename} -help"
exit 0
