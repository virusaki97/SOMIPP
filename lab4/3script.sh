#! /bin/bash
strings /var/log/Xorg.0.log | grep II | sed 's/II/Information:/g' > full.log
strings /var/log/Xorg.0.log | grep WW | sed 's/WW/Warning:/g' >> full.log
cat full.log
exit 0