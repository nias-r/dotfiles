#!/bin/bash

function logdate() {
		/usr/local/bin/gdate $* 2> /dev/null || date
}

echo "`TZ=UTC logdate -Iseconds`: Beginning backup"
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Photo\ Library/ s3://richardnias/photos/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Movies/sofa/ s3://richardnias/sofa/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Lightroom/ s3://richardnias/lightroom/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Music/iTunes/iTunes\ Media/Music/ s3://richardnias/music/ --storage-class STANDARD_IA
echo "`TZ=UTC logdate -Iseconds`: Finished backup"
