#!/bin/bash

apt-get update -qq
apt-get -qy --only-upgrade install $APTLIST
