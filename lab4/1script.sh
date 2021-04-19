#! /bin/bash

strings /var/log/* | grep ACPI > ~/Desktop/lab3/lab4/error.log
exit 0