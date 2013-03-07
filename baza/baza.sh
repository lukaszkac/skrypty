#!/bin/bash
# 
# Autor: Łukasz Kąc
#
zmienna="h"
while [ zmienna != "q" ] ; do
case $zmienna in
  "h")  clear
	echo "Program obsłui bazy"
	echo "Witaj. Co chcesz zrobić"
	echo "h - Ta informacja,"
	echo "w - Wyświetlenie bazy"
	echo "a - Dodanie wpisu"
	echo "r - Usuniecie wpisu"
	echo "z - Zapis sumy kontrolnej md5"
	echo "s - Sprawdzenie sumy kontrolnej md5";;
  "w")  clear
	echo "Obecne wpisy bazy danych" 
	cat baza.txt ;;
  "q")  clear
	echo "Dziękujemy i zapraszamy ponownie"
	exit;;
  "t")  echo $c;;
  "a")  clear
	ost=`wc -l baza.txt | awk '{print $1}'`
	nas=$(($ost+1))
	echo "Podaj imię, nazwisko, Adres IP "
	read d
	echo "Wpis został dodany"
	echo "$nas. $d" >> baza.txt;;
  "r")  clear
	echo "Podaj który wpis ma zostać usunięty"
	read g
	nrwpisu=`grep ^$d baza.txt`
	clear
	echo "Potwierdź (y/n)"
	echo "$nrwpisu"
	read d
		case $d in
		  "y"|"t"|"TAK"|"tak")	clear
					sed -i "${g}d" baza.txt 
					echo "Wpis $nrwpisu usunięty";;
		  "n"|"NIE"|"nie")  clear
			echo "Zmiany NIE wprowadzone"
		esac;;
  "z")  clear
	md5sum baza.txt > baza.md5
	echo "Suma kontrolan wygenerowana";;
  "s")  clear
	md5sum baza.md5 -c;;
  *)    clear
	echo "Wpisałeś $zmienna. Nie wiem co to jest"
esac

read zmienna
done
