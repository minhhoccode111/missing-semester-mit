#!/bin/env bash

journalctl | grep -i intel

journalctl | rg -i --stats intel

ssh myserver journalctl

ssh myserver journalctl | grep sshd

ssh myserver 'journalctl | grep sshd | grep "Disconnected from"' | less

ssh myserver 'journalctl | grep sshd | grep "Disconnected from"' > ssh.log
less ssh.log

ssh myserver journalctl
    | grep sshd
    | grep "Disconnected from"
    | sed 's/.*Disconnected from //'

# s/REGEX/SUBSTITUTION

perl -pe 's/.*?Disconnected from //'

| sed -E 's/.*Disconnected from (invalid |authenticating )?user .* [^ ]+ port [0-9]+( \[preauth\])?$//'

ssh myserver journalctl
    | grep sshd
    | grep "Disconnected from"
    | sed -E 's/.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$/\2/'

ssh myserver journalctl
    | grep sshd
    | grep "Disconnected from"
    | sed -E 's/.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$/\2/'
    | sort | uniq -c

ssh myserver journalctl
    | grep sshd
    | grep "Disconnected from"
    | sed -E 's/.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$/\2/'
    | sort | uniq -c
    | sort -nk1,1 | tail -n10

ssh myserver journalctl
    | grep sshd
    | grep "Disconnected from"
    | sed -E 's/.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$/\2/'
    | sort | uniq -c
    | sort -nk1,1 | tail -n10
    | awk '{print $2}' | paste -sd,


