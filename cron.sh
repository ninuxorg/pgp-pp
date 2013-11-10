#!/bin/sh

# PGP Permanent Party was deployed during 
#  NinuxDay09 http://wiki.ninux.org/NinuxDay2009en
#
#  Copyright (C) 2009 Claudio Mignanti
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

KEYDB=ninux.org
SERV="--keyserver pgp.mit.edu --keyserver keyserver.ubuntu.com"
OPT=" --no-default-keyring --keyring $KEYDB $SERV"


NEW_K=0

#update keys
ids=$(gpg $OPT --with-colons --list-keys | grep ^pub | cut -d: -f5)
gpg $OPT --recv-keys $ids 2>&1 >/dev/null

for c in `cat ./chiavi`; do
	gpg $OPT --recv-keys $c
	NEW_K=1
done
echo "" > ./chiavi

if [ -n $NEW_K ]; then
	exit 0;
fi

cp ninux.org.png evolution/ninux.org.`date +%m%d%H%M%S`.png

#grafiz
_TMPGRAPH=/tmp/firme.dot
_TMPPS=/tmp/$(basename $_TMPGRAPH .dot).ps

gpg $OPT --list-sigs | sig2dot -a > $_TMPGRAPH
neato -Tps $_TMPGRAPH > $_TMPPS
convert $_TMPPS ./$KEYDB.png

