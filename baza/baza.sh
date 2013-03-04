#!/bin/bash
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
	echo "s - sprawdzenie sumy kontrolnej md5";;
  "w")  clear
	echo "W bazie danych mamy:" 
	cat baza.sh ;;
  "q")  clear
	echo "Dziękujemy i zapraszamy ponownie"
	exit;;
  "t")  echo $c;;
  "a")  clear
	ost=`wc -l baza.sh | awk '{print $1}'`
	nas=$(($ost+1))
	echo "Podaj imię, nazwisko, Adres IP "
	read d
	echo "Wpis został dodany"
	echo "$nas. $d" >> baza.sh;;
  "r")  clear
	echo "Podaj który wpis ma zostać usunięty"
	read g
	nrwpisu=`grep ^$d baza.sh`
	clear
	echo "Chcesz usunąć wpis (y/n)"
	echo "$nrwpisu"
	read d
		case $d in
		  "y"|"t"|"TAK"|"tak")	clear
					sed -i "${g}d" baza.sh 
					echo "Wpis $nrwpisu usunięty";;
		  "n"|"NIE"|"nie")  clear
			echo "Zmiany NIE wprowadzone"
		esac;;
  "z")  clear
	md5sum baza.sh > baza.md5
	echo "Suma kontrolan wygenerowana";;
  "s")  clear
	md5sum baza.md5 -c;;
  *)    clear
	echo "Wpisałeś $zmienna. Nie wiem co to jest"
esac
 
read zmienna
done
