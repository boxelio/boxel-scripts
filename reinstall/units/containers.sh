#!/bin/sh

#
# reinstall-containers.sh
#
# Reinstall all of the defined Docker containers
#

../remove/units/containers.sh
../install/units/containers.sh
