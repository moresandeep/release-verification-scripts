#!/bin/sh
####################################################
# test.sh USERNAME
####################################################

USERNAME=$1

echo "Client Credentials Test"
response=$(curl -sku $USERNAME 'https://localhost:8443/gateway/cc-test/clientid/api/v1/oauth/credentials')
#echo "response: " $response
CLIENT_ID=$(jq -r '.client_id' <<< "$response")
CLIENT_SECRET=$(jq -r '.client_secret' <<< "$response")

echo "     ClientId: " $CLIENT_ID
echo "Client Secret: "$CLIENT_SECRET

response=$(curl -sk -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}&grant_type=client_credentials" 'https://localhost:8443/gateway/cc-target/knoxtoken/api/v2/token')
#echo "response: " $response
TOKEN=$(jq -r '.access_token' <<< "$response")
TOKEN_ID=$(jq -r '.token_id' <<< "$response")

echo "Access Token: " $TOKEN
echo "     TokenId: " $TOKEN_ID

echo
echo
echo "API Key Test"
response=$(curl -sku $USERNAME 'https://localhost:8443/gateway/apikey-test/apikey/api/v1/auth/key')
#echo "response: " $response
KEY_ID=$(jq -r '.key_id' <<< "$response")
API_KEY=$(jq -r '.api_key' <<< "$response")

echo "  KeyId: " $KEY_ID
echo "API Key: " $API_KEY


# Use the API Key as a bearer token to get a JWT (as an example)
response=$(curl -sk -H "Authorization: Bearer $API_KEY" 'https://localhost:8443/gateway/apikey-target/knoxtoken/api/v2/token')
#echo "response: " $response
TOKEN=$(jq -r '.access_token' <<< "$response")
TOKEN_ID=$(jq -r '.token_id' <<< "$response")

echo "Access Token: " $TOKEN
echo "     TokenId: " $TOKEN_ID

