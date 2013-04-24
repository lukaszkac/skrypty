#!/bin/bash
# SSHFD serwerów
echo "Montowanie serwera Provider"
sshfs admin@tarzan.serwery.pl:/ /home/lukaszkac/serwery/provider 
echo "Montowanie serwera Active"
sshfs tarzan@tarzan.nazwa.pl:/.file /home/lukaszkac/serwery/active
