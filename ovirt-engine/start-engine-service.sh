#!/bin/bash

docker start ovirt-engine-dev

docker exec -it -u ssh_ovirt ovirt-engine-dev /env/start-engine-service.sh