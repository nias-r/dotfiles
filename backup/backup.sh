#!/bin/bash
set -e

trap 'echo "FAILED!" | ts ${DATE_FORMAT}' ERR

TZ=UTC
DATE_FORMAT="%Y-%m-%dT%H:%M:%S%z"

echo "Beginning backup" | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Photo\ Library/ s3://richardnias/photos/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/Movies/sofa/ s3://richardnias/sofa/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Lightroom/ s3://richardnias/lightroom/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/Music/iTunes/iTunes\ Media/Music/ s3://richardnias/music/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/Music/Ableton/User\ Library/ s3://richardnias/ableton-user-library/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/projects/ s3://richardnias/ableton-projects/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
/Users/nias/.local/bin/aws s3 sync /Users/nias/sounds/ s3://richardnias/sounds/ --storage-class STANDARD_IA --no-progress | ts ${DATE_FORMAT}
echo "Finished backup" | ts ${DATE_FORMAT}
