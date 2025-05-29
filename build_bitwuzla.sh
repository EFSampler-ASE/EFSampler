#! /bin/sh

set -e

git clone https://github.com/bitwuzla/bitwuzla.git
cd bitwuzla
git checkout f229d64be7c4a8c6817332a41d0d2764dbdfbfe4
cp -r ../bitwuzla-patch/* .
make -j
