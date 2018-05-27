#!/bin/bash

# Init postgresql and create user[engine/engine], database[engine]

# Run make clean install-dev PREFIX=/env/deploy BUILD_UT=0

# Run engine-setup

# Debug configuration
echo "ENGINE_DEBUG_ADDRESS=0.0.0.0:8787" >> /env/deploy/etc/ovirt-engine/engine.conf.d/10-setup-protocols.conf
echo "ENGINE_JMX_INTERFACE=public" >> /env/deploy/etc/ovirt-engine/engine.conf.d/10-setup-protocols.conf

