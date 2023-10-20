
clear
arg1=$1
arg2=${2:-'e'}

bash ./lib/repeat.sh 100 "bash ./lib/guess-wifi-password.sh -$arg1$arg1" | grep $arg2 | sort -u | pv -l -s 16 -p -e -t -i 0.1 -c -N "Mencari hasil yang terbaik..." | pick


