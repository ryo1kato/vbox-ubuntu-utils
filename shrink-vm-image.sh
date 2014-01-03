#!/bin/sh
set -ue
set -x
sudo apt-get clean
pv /dev/zero | sudo dd of=/zero || true
sudo rm -f /zero
