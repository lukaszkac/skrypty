#!/bin/bash
#Program podający ściezki do plików z ldap

while [ active != "q" ] ; do
read -p LDAP\> option active 
case $option in
  "h")  
	echo "Pomoc";;
  "kreator|kr")
	echo "vim cn=kreator,cn=activekreator,ou=services,uid=$active,dc=nazwa,dc=pl,o=netart"
esac

#echo "vim cn=kreator,cn=activekreator,ou=services,uid=$active,dc=nazwa,dc=pl,o=netart $option"
done
