#!/bin/sh

usr=$1
pwd=$2
img=$3
tag=$4

# this creates a docker hub access token using ROPC oauth flow
HUB_TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'$usr'", "password": "'$pwd'"}' https://hub.docker.com/v2/users/login/ | grep -o '"token":[^"]*"[^"]*"' | sed -E 's/".*".*"(.*)"/\1/')

#uses previously obtained jwt access token to invoke the DELETE api and remove tha specific 'image:tag'
curl -X DELETE -s -H "Accept: application/json" -H "Authorization: JWT $HUB_TOKEN" https://hub.docker.com/v2/repositories/$img/tags/$tag/