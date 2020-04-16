#!/bin/bash
###############################################
# Verify the Knox releases
# download all the artifacts (signatures and binary)
# copy this file to the dir.
# verify.sh 1.1.0
###############################################

RC_VERSION=$1
OUTPUT_FOLDER=$2

# args
# 1. fileName
# 2. hash to comapre
# 3. SHA type, sha256 or sha512
verifySha () {	
	local FILE=$1
	
	if [ "$3" = "sha256" ]; then
	    local RESULT=$(openssl sha256 "$FILE")
	else
	    local RESULT=$(openssl sha512 "$FILE")
	fi
	
	local SHA=${RESULT##*=}
	local SHA=$(echo "${SHA}" | tr -d '[:space:]')
	
	if [ "$SHA" = "$2" ]; then
	    echo $3 " Hash match for file " $1
	else
	    echo $3 " Hash don't match for file " $1
		exit -1
	fi
}

gpg --verify $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip.asc $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip
gpg --verify $OUTPUT_FOLDER/knox-$RC_VERSION.zip.asc $OUTPUT_FOLDER/knox-$RC_VERSION.zip
gpg --verify $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz.asc $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz
echo "***** checking SHA256 *****"

verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION-src.zip" $(cat $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip.sha256) "sha256"
verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION.zip" $(cat $OUTPUT_FOLDER/knox-$RC_VERSION.zip.sha256) "sha256"
verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz"  $(cat $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz.sha256) "sha256"
echo "***** checking SHA512 *****"
verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION-src.zip"  $(cat cat $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip.sha512) "sha512"
verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION.zip"  $(cat $OUTPUT_FOLDER/knox-$RC_VERSION.zip.sha512) "sha512"
verifySha "$OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz"  $(cat $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz.sha512) "sha512"

echo "Hash verification done ..."


#echo "***** checking MD5 *****"
#openssl md5 $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip && cat $OUTPUT_FOLDER/knox-$RC_VERSION-src.zip.md5
#echo ""
#openssl md5 $OUTPUT_FOLDER/knox-$RC_VERSION.zip && cat $OUTPUT_FOLDER/knox-$RC_VERSION.zip.md5
#echo ""
#openssl md5 $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz && cat $OUTPUT_FOLDER/knox-$RC_VERSION.tar.gz.md5
#echo ""