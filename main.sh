#!/bin/sh
####################################################
# Download artifacts and unzip them
# Arguments:
## 1. http link to release candidate
## 2. folder to put artifacts into
# usage
# ./download_artifacts.sh https://dist.apache.org/repos/dist/dev/knox/knox-1.4.0/ /Users/smore/dev/release-verification/1.4.0-RC1
####################################################

EXTENSION="zip"
URL=$1
OUTPUT_DIR=$2
# drop forward slash if included
OUTPUT_DIR=${OUTPUT_DIR%%/}
FILELIST=()

files=$(curl $1 | sed -n 's/.*href="\([^"]*\).*/\1/p')
IFS='
'
count=0
for file in $files
do
  count=$((count+1))
  echo "Downloading -- " $file
  wget -P $2 $1$file
done

## Uzzip
for t in $OUTPUT_DIR/*.$EXTENSION
do
	FILENAME="${t##*/}"
	FILENAME=${FILENAME%.zip}
	unzip $t -d $2/$FILENAME
	FILELIST+=($OUTPUT_DIR/$FILENAME)
done

DROP_SLASH=${URL%%/}
RC_VERSION=${DROP_SLASH##*/knox-}
echo RC_VERSION

## Verify
echo $OUTPUT_DIR
source verify.sh $RC_VERSION $OUTPUT_DIR