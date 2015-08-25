#!/bin/bash

# super basic setup stuff for axiom assuming that vagrant, virtualbox, and
# virtualbox extensions have been installed. This script will likely be added
# to as we figure out other things that need to be preconfigured for a
# completely clean install.
sudo usermod -a -G vboxusers $USER
vagrant box add ubuntu/trusty64 https://atlas.hasicorp.com/ubuntu/boxes/trusty64
