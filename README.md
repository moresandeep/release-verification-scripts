# release-verification-scripts
Scripts to test release verification for Apache Knox.

The script will 
* Download RC artifacts to the given folder 
* Unzip zip files
* Verify gpg and SHA signatures

## Arguments
* URL to release candidate (e.g. https://dist.apache.org/repos/dist/dev/knox/knox-1.4.0/)
* Directory where you want the artifacts to be downloaded to (e.g. /Users/smore/dev/release-verification/1.4.0-RC1)

## Usage
`main.sh https://dist.apache.org/repos/dist/dev/knox/knox-1.4.0/ /Users/smore/dev/release-verification/1.4.0-RC1`
