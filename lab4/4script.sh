#! /bin/bash
grep -r -E -o -h -a "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" /etc/* | sort --uniq| awk '{printf(", %s",$1)}' | cut -c3-   > emails.lst
cat emails.lst
exit 0
# -a --binary-files=text