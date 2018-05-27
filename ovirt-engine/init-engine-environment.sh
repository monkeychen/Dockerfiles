#!/bin/bash
docker stop ovirt-engine-dev && docker rm ovirt-engine-dev

docker run -d -i -t --name ovirt-engine-dev -h ovirt-engine-dev --privileged \
-v /env/.m2/:/env/.m2 -v ~/workspace/cloudos/ovirt/ovirt-engine:/env/workspace -v /env/ovirt-engine-deploy:/env/deploy \
-p 10022:22 -p 5432:5432 -p 8080:8080 -p 8787:8787 -p 8443:8443 \
simiam/ovirt-engine-dev /usr/sbin/init