#!/bin/bash
cd ~/foo/bar
url="$1"
name=$(basename "${url}")
wget "${url}" -O "${name}.aux"
title=$(url_title.py ${name}.aux)

mkdir --parent "${title}"
grep -Po '(?<=href=")[^ ]*?(\.webm|\.gif|\.png|\.jpg)' "${name}.aux" | sort | uniq | awk '{print "http:"$1}' > "${name}.list"
wget --no-clobber --continue --input-file="${name}.list" --directory-prefix="${title}/"
rm "${name}.aux" "${name}.list"
