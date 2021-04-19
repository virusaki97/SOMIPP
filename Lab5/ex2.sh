#!/bin/bash
echo "Ultimul proces lansat: "
echo "PID  Start Time"
ps -aux | awk '{ print $2, $9;}' | tail -n 1	#tail -n 1 afiseaza ultima linie
exit 0;
