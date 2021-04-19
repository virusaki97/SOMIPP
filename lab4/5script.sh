#! /bin/bash
strings /bin/* | grep -E "^\#\!/bin/sh$" | wc -l
strings /bin/* | grep -E "^\#\!/bin/bash$" | wc -l
strings /usr/bin/* | grep -E "^\#\!/usr/bin/perl$" | wc -l
strings /usr/bin/* | grep -E "^\#\!/bin/tcl.$" | wc -l
exit 0