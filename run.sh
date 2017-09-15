#!/bin/sh

echo "-------------------------------------------------------------------------"
echo "Setting up containers"
echo "-------------------------------------------------------------------------"
docker build -t neclimdul/pecl_yaml_alpine_bug:alpine -f ./Dockerfile.alpine ./
docker build -t neclimdul/pecl_yaml_alpine_bug:debian -f ./Dockerfile.debian ./
docker pull ruby:alpine
docker pull ruby:jessie

echo "-------------------------------------------------------------------------"
echo "Starting Tests"
echo "-------------------------------------------------------------------------"


echo "Testing PHP Alpine"
docker run --rm -v "$(pwd)/src:/usr/src" neclimdul/pecl_yaml_alpine_bug:alpine php /usr/src/test.php
echo "Testing PHP Debian"
docker run --rm -v "$(pwd)/src:/usr/src" neclimdul/pecl_yaml_alpine_bug:debian php /usr/src/test.php
echo "Testing Ruby Alpine"
docker run --rm -v "$(pwd)/src:/usr/src" ruby:alpine ruby /usr/src/test.rb
echo "Testing Ruby Debian"
docker run --rm -v "$(pwd)/src:/usr/src" ruby:jessie ruby /usr/src/test.rb

# echo "-------------------------------------------------------------------------"
# echo "Cleaning up"
# echo "-------------------------------------------------------------------------"
# docker rmi neclimdul/pecl_yaml_alpine_bug:alpine
# docker rmi neclimdul/pecl_yaml_alpine_bug:debian
