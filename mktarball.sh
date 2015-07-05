#!/bin/sh

name="enc"
version="`cat $name.c | grep '$Id: '$name'.c,v' | cut -d' ' -f3`"
files="$name $name.c $name.h aes.c aes.h doexec.c doexec_unix.h doexec_win32.h pel.c pel.h readwrite.h sha1.c sha1.h socket_code.h misc.h Makefile mktarball.sh README COPYING CHANGES"

echo "[i] making tarball..."
mkdir $name-$version
tar --exclude=CVS -cf temporaryplace-$version.tar $files
tar -C $name-$version -xf temporaryplace-$version.tar
rm -f $name-$version.tar.gz
tar -czf $name-$version.tar.gz --numeric-owner $name-$version
rm -rf $name-$version
rm -rf temporaryplace-$version.tar
chmod 0644 $name-$version.tar.gz
echo "[i] done"
