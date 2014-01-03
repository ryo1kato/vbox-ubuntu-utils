#!/bin/sh
#
# Find large package in Debian/Ubuntu
#

dpkg --get-selections |
	awk '{print $1}' |
	xargs apt-cache show |
	egrep '^(Package|Installed-Size): ' |
	tr '\n' ',' |
	sed -e 's/,*Package: /\n/g' -e 's/,*Installed-Size: /,/g' |
	sort -t, -k2 -n
