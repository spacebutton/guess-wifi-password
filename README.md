# guess-wifi-password.sh

Let's break into your neighbor's wifi security with the wordlist similar to the word "semmsemm" at random.

# Screenshot 
![preview](./demo_1.jpg)

[![asciicast](https://asciinema.org/a/561147.svg)](https://asciinema.org/a/561147)

the screenshot above has something to do with the demo.mp4 file, please watch the video.

# Dependencies

1. pv
2. pick
3. sort
4. grep
5. shuf
6. fold
7. sed
8. basename, dirname

# Usage :

singgle command

```./guess-wifi-password -m {a..z}``` 

or with combine

```bash repeat.sh 15 "bash guess-wifi-password.sh -mm"```

A one-line command that generates an unduplicated random password with a progress bar (pv) to make it interactive

```sh
bash gwp_interactive.sh m
```

will produce the word "semmsemm" or whatever but the suffix will be retained as mm, for details see -help.

Motivation :
* Neighbor's wifi

* https://www.google.com/amp/s/www.detik.com/edu/detikpedia/d-5758742/mengenal-huruf-konsonan-dan-bedanya-dengan-vokal-serta-diftong/amp

Changelog:

0/0/0

+ Add script repeat.sh
+ Fix bug

07/03/23
+ Change repo name

10/10/23 [102]
+ Add gwp_wordlist.txt
+ Add v wordlist
+ Change readme.md
  
  
