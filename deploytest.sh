#!/bin/sh
####################################################
# Install the test topologies
# Arguments:
## 1. The path to the test configuration directory
## 2. The path to the release candidate directory
# usage
# ./deploytest.sh $TEST_CONF_DIR  $APACHE_KNOX_RC_INSTALL_DIR
####################################################

TEST_CONF_DIR=$1
RC_INSTALL_DIR=$2

# drop forward slash if included
RC_INSTALL_DIR=${RC_INSTALL_DIR%%/}
TEST_CONF_DIR=${TEST_CONF_DIR%%/}

echo "Test config: $TEST_CONF_DIR"
echo "Release Candidate installation: $RC_INSTALL_DIR"

cp -r $TEST_CONF_DIR/common-conf/shared-providers/* $RC_INSTALL_DIR/conf/shared-providers/

cp -r $TEST_CONF_DIR/APIKEY/conf/descriptors/* $RC_INSTALL_DIR/conf/descriptors/
cp -r $TEST_CONF_DIR/ClientCredentials/conf/descriptors/* $RC_INSTALL_DIR/conf/descriptors/


