#!/bin/bash
# Nowa KV
# Autor: Lukasz Kac
zmienna="h"
while [ zmienna != "q" ] ; do
read -p FasT-kv\> zmienna
echo -e "\e[0;31m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[00m"
curl --user "netart:serwery" https://techniq.netart.pl/kv/?q=$zmienna 2> /dev/null | egrep label.*Adres\|label.*Nazwa\|label.*Opcja\|label.*Host\|label.*Mail\|label.*Fizyczny\|label.*Server\|label.*Bazy | sed -e 's/^.*label\"//g;s/\/td.*value-//g;s/a\ href.*gi\"//g;s/a\ href.*us//g;s/\/t.*tr//g;s/a\ tit.*net.pl\"//g;s/a\ href\=\"mailto.*\"//g;s/ip\"/IP/g;s/nazwa\"//g;s/email\"//g;s/fiz\"/email/g;s/db\"//g;s/\/a//g;'|sed -e 's/Opcj.*normal/Opcja|Active/g;s/Opcj.*pro/Opcja|ActivePro/g;s/Opcj.*max/Opcja|ActiveMax/g;s/Opcj.*maxTest/Opcja|ActiveMax/g;s/Opcj.*small/Opcja|StronaWWW/g;s/Opcj.*cms2Std/Opcja|StronaWWW|Standard/g;s/Opcj.*cms2Premium/Opcja|StronaWWW|Premium/g;s/Opcj.*mailSolo/Opcja|PocztaSolo/g;s/Opcj.*mailMulti/Opcja|PocztaMidi/g;s/Opcj.*mailMega/Opcja|PocztaMaxi/g;s/Opcj.*shop/Opcja|Sklepicom/g;s/Opcj.*shopPro/Opcja|SklepicomPro/g;s/Opcj.*WWW\ ACTIVE/Opcja|KreatorMini/g;s/Opcj.*kreatorStd/Opcja|KreatorMidi/g;s/Opcj.*kreatorPro/Opcja|KreatorMaxi/g;'| tr "<>\"" " " | awk '{print $1, $3, $4}'| sed ''/Mail/s//`printf "\033[36mEmail:\033[0m"`/'' | sed ''/Server\ email/s//`printf "\033[36mMailstore:\033[0m"`/'' | sed ''/Nazwa/s//`printf "\033[36mNazwa:\033[0m"`/'' | sed ''/Opcja/s//`printf "\033[36mOpcja:\033[0m"`/'' | sed ''/Bazy/s//`printf "\033[36mBazy:\033[0m"`/'' | sed ''/Fizyczne/s//`printf "\033[36mFizyczne:\033[0m"`/''  | sed ''/Fizyczny/s//`printf "\033[36mFizyczny:\033[0m"`/''  | sed ''/Host/s//`printf "\033[36mHost:\033[0m"`/''  | sed ''/Adres\ IP/s//`printf "\033[36mAdres|IP:\033[0m"`/'' |tr "|" " " | sed s/\)/\)\\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~/g

done
