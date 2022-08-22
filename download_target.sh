#!/bin/sh

YTDL_EXE="${YTDL_EXE:-yt-dlp}"
ARCHIVE_FILENAME="${ARCHIVE_FILENAME:-archive.txt}"
TEMPLATE_FILENAME="${TEMPLATE_FILENAME:-template.txt}"

TARGET_CONFIG_FILENAME="target.txt"

# Target dir is a single target (inside destdir - destdir is not needed here)
target_dir="${1%/}"
target_file="$target_dir/$TARGET_CONFIG_FILENAME"

target_id="$2"

dest_template="$target_dir/%(webpage_url_domain)s - [%(id)s] - %(release_date>%Y-%m-%d,upload_date>%Y-%m-%d)s - %(title)s.%(ext)s"

# TODO: print a warning message before exiting
[ -f "$target_file" ] || exit 1

# Read template file from parent directory of target dir
template_path="$(realpath "$target_dir/..")/$TEMPLATE_FILENAME"
[ -f "$template_path" ] && dest_template="$target_dir"/"$(cat "$template_path")"

name="$(sed -n '1p' "$target_file")"
url="$(sed -n '2p' "$target_file")"
options="$(sed -n '3p' "$target_file")"

printf "[%04d] Downloading target '%s'...\n" "$target_id" "$name"

$(which "$YTDL_EXE") $YTDL_DEFAULT_ARGS $options \
    --output "$dest_template" \
    --download-archive "$target_dir/$ARCHIVE_FILENAME" \
    "$url"

printf "[%04d] Finished.\n" "$target_id"
