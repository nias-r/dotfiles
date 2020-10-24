#!/bin/bash
set -e

trap 'echo "FAILED!" | ts ${DATE_FORMAT}' ERR

DATE_FORMAT="%Y-%m-%dT%H:%M:%S%z"

sync_files() {
	/Users/nias/.local/bin/aws s3 sync "$1" "$2" --exclude "*.DS_Store" --storage-class STANDARD_IA --no-progress | /usr/local/bin/ts ${DATE_FORMAT}
}

echo "Beginning backup" | /usr/local/bin/ts ${DATE_FORMAT}
sync_files /Users/nias/Pictures/Photo Library/ s3://richardnias/photos/
sync_files /Users/nias/Movies/sofa/ s3://richardnias/sofa/
sync_files /Users/nias/Pictures/Lightroom/ s3://richardnias/lightroom/
sync_files /Users/nias/Music/iTunes/iTunes\ Media/Music/ s3://richardnias/music/
sync_files /Users/nias/Music/Ableton/User\ Library/ s3://richardnias/ableton-user-library/
sync_files /Users/nias/Music/projects/ s3://richardnias/ableton-projects/
sync_files /Users/nias/Music/sounds/ s3://richardnias/sounds/
echo "Finished backup" | /usr/local/bin/ts ${DATE_FORMAT}
