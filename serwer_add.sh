#!/bin/bash
# SSHFD serwerów
echo "Montowanie serwera Provider"
echo FATALITY1a | sshfs admin@tarzan.serwery.pl:/ /home/lukaszkac/serwery/provider -o workaround=rename -o password_stdin
echo "Montowanie serwera Active"
echo FATALITY1a | sshfs tarzan@tarzan.nazwa.pl:/.file /home/lukaszkac/serwery/active -o workaround=rename -o password_stdin
