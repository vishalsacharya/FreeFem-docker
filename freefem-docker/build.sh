#!/usr/bin/env bash

## Copy the compiled files of FreeFem++
echo -e "> Extracting ff++-compiled from compiled version"
sudo docker run --rm -d freefem:compilation | sudo xargs -I {} docker cp {}:/usr/freefem ff++-compiled

## Build the docker for FreeFem++ compilation
echo -e "> Building freefem++ Docker image"
sudo docker build --network=host -t freefem .

## Remove compiled files of FreeFem++
echo -e "> Remove ff++-compiled"
sudo rm -R ff++-compiled

## Save the docker
echo -e "> Saving the freefem image"
sudo docker save -o freefem.tar freefem

## Compress the image
echo -e "> Compressing the archive"
sudo gzip freefem.tar
