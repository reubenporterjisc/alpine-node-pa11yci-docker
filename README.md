# alpine-node-pa11yci-docker

A docker image based off Alpine which enables use of pa11y-ci 

https://github.com/pa11y/pa11y-ci

## Pull the image from dockerhub

`docker pull reubenporter123/alpine-node-pa11yci:1.0`

## How to use from this repo

`docker build --tag alpine-node-pa11y:1.0`

`docker run -it alpine-node-pa11y:1.0 /bin/ash`

Note a new user with limited permissions is created. If you need root permission then pass the `--user root` flag.

To run an accessibility test based on your config file run `pa11y-ci`
