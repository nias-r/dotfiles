#!/bin/bash
echo "Beginning backup at `date`"
/usr/local/bin/aws s3 sync /Users/nias/Pictures/Photo\ Library/ s3://richardnias/photos/ --storage-class STANDARD_IA 
/usr/local/bin/aws s3 sync /Users/nias/Movies/sofa/ s3://richardnias/sofa/ --storage-class STANDARD_IA 
/usr/local/bin/aws s3 sync /Users/nias/Pictures/Lightroom/ s3://richardnias/lightroom/ --storage-class STANDARD_IA 
/usr/local/bin/aws s3 sync /Users/nias/Music/iTunes/iTunes\ Media/Music/ s3://richardnias/music/ --storage-class STANDARD_IA 
echo "Finished backup at `date`"
