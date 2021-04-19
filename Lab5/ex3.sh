#!/bin/bash
file="PID.txt"
echo "Lista cu PID-ul proceselor pornite cu comenzile localizate în /sbin/ : ">$file
ps aux | grep -w "/sbin/*" | awk '{ print $2;}'>>$file
exit 0;

grep -w, --word-regexp
              selecteaza liniile ce contin cuvintele alese