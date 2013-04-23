#!/bin/bash

#Skrypt pobierający słówko i idiom dnia z serwisu ang.pl
#stworzone przez SCT/Adawo <adawo.roag@gmail.com>
#na licencji GPL 

#Pobieramy słówko dnia...
wget "http://www.ang.pl/slowko_dnia.php?today=1&print=1" -q -O /tmp/slowko_dnia
#usuwamy tagi html | kodowanie z iso-8859-1 na iso-8859-2 | 
html2text -nobs /tmp/slowko_dnia | iconv -f iso-8859-2 | sed -e "s/\ \{2\,\}//g; s/\\[img[a-zA-Z0-9 ./\n:]*\]//g; s/\\[http[a-zA-Z0-9 ./\n:]*\]//g; s/\\[Unknow[a-zA-Z0-9 ./\n:]*\]//g;" > /tmp/slowko_tmp


#S£ÓWKO DNIA
word=$(echo `cat /tmp/slowko_tmp | head -n 22 | tail -n 1 | sed -e "s/\[[a-zA-Z\/]*//g"`) #Slowko dnia

def_start=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*DEFIN*" -b | head -c 3`)
def_end=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*EXAMPLE\:" -b | head -c 3`)
word_definiction=$(echo `cat /tmp/slowko_tmp | tr "\n" "  " | cut -b "$def_start-$def_end" | sed -e "s/DEFINITION: //g"`)

#wycinamy przykład
exa_end=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*POLISH TRANS" -b | head -c 3`)
exa_start=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*EXAMPLE\:" -b | head -c 3`)
word_example=$(echo `cat /tmp/slowko_tmp | tr "\n" "  " | cut -b "$exa_start-$exa_end" | sed -e "s/EXAMPLE: //g"`) 

#translacja
word_translation=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*POLISH TRANSLATION: " | head -n 1 | sed -e "s/POLISH TRANSLATION: //g"`)

#IDIOM DNIA:
idiom_start=$(echo `cat /tmp/slowko_tmp | grep -e "IDIOM OF THE DAY" -n | head -c 2`) 
idiom=$(echo `cat /tmp/slowko_tmp | head -n $(expr $idiom_start + 2) | tail -n 1`)

exa_start=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*EXAMPLE\:" -b | tail -n 1 | head -c 3`)
exa_end=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*POLISH TRANS" -b | tail -n 1 | head -c 3`)
idiom_example=$(echo `cat /tmp/slowko_tmp | tr "\n" "  " | cut -b "$exa_start-$exa_end" | sed -e "s/EXAMPLE: //g"`) 

idiom_translation=$(echo `cat /tmp/slowko_tmp | grep -e "[ \t]*POLISH TRANSLATION: " | tail -n 1 | sed -e "s/POLISH TRANSLATION: //g"`)

#WYPISUJEMY:
echo -e "\033[0;31mS£ÓWKO DNIA:\033[0m $word"
echo -e "\033[0;31mDEFINICJA:\033[0m $word_definiction"
echo -e "\033[0;31mPRZYK£AD:\033[0m $word_example"
echo -e "\033[0;31mTRANSLACJA:\033[0m $word_translation"
echo 
echo -e "\033[0;31mIDIOM:\033[0m $idiom"
echo -e "\033[0;31mPRZYK£AD:\033[0m $idiom_example"
echo -e "\033[0;31mTRANSLACJA:\033[0m $idiom_translation"

#Sprzatamy po sobie śmeci...
rm /tmp/slowko_dnia /tmp/slowko_tmp
