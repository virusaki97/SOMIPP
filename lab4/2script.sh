#! /bin/bash
wc -l /var/log/*.log | tail -n -1 
exit 0