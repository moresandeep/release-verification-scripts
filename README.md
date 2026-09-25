# release-verification-scripts
Scripts to test Apache Knox release candidates.

## main.sh / verify.sh
* Download RC artifacts to the given folder 
* Unzip zip files
* Verify gpg and SHA signatures

#### Arguments
* URL to release candidate (e.g. https://dist.apache.org/repos/dist/dev/knox/knox-3.0.0/)
* Directory where you want the artifacts to be downloaded to (e.g., ~/dev/release-candidates/3.0.0-RC1)

#### Usage
`main.sh https://dist.apache.org/repos/dist/dev/knox/knox-3.0.0/ ~/dev/release-candidates/3.0.0-RC1`

## deploytest.sh
* Install the configurations from the test configuration directory to the specified release candidate installation directory

#### Arguments
* The test configuration root directory
* The release candidate installation directory

#### Usage
##### Binary distribution example
`deploytest.sh ./release-test-configs/ ~/dev/release-candidates/3.0.0-RC1/knox-3.0.0/knox-3.0.0/`

##### Built-from-src example (after build and 'ant-install-home')
`deploytest.sh ./release-test-configs/ ~/dev/release-candidates/3.0.0-RC1/knox-3.0.0-src/knox-3.0.0/install/knox-3.0.0`

## test.sh
* Run the tests

#### Arguments
* One of the demo LDAP user names

#### Usage 
`test.sh sam`


