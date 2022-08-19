#!/bin/sh

#echo "There are $# arguments"
#echo "$@"
#echo
#exit

seq_num="$1"
print_id() { printf "[%04d]: " "$seq_num"; }

name="$2"
print_id; printf "Downloading target %s...\n" "$name"

dest="$ROOTDIR/$3"
url="$4"
opts="$5"

print_id; printf "Target name '%s', dest '%s', url '%s', options '%s'\n" "$name" "$dest" "$url" "$opts"
#print_id; printf "Default arguments '%s'\n" "$YTDL_DEFAULT_ARGS"
#sleep 1


#print_id
$(which "$YTDL_EXE") $YTDL_DEFAULT_ARGS $opts \
    --output "$dest/%(webpage_url_domain)s - %(id:1:-1)s - %(release_date>%Y-%m-%d,upload_date>%Y-%m-%d|Unknown)s - %(title)s.%(ext)s" \
    --download-archive "$dest/$ARCHIVE_FILENAME" \
    "$url"

print_id; printf "Done.\n"
