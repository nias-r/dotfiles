#!/bin/bash
alias gdate=/usr/local/bin/gdate
echo "`TZ=UTC gdate -Iseconds`: Beginning backup"
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Photo\ Library/ s3://richardnias/photos/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Movies/sofa/ s3://richardnias/sofa/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Pictures/Lightroom/ s3://richardnias/lightroom/ --storage-class STANDARD_IA
/Users/nias/.local/bin/aws s3 sync /Users/nias/Music/iTunes/iTunes\ Media/Music/ s3://richardnias/music/ --storage-class STANDARD_IA
echo "`TZ=UTC gdate -Iseconds`: Finished backup"
