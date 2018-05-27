#!/bin/bash

cd /env
file_num=$(ls -l /env/deploy | grep bin | wc -l)
echo "file number is [$file_num] in /env/deploy directory."
if [ $file_num -gt 0 ]; then
    echo "/env/deploy has contents, so ignoring extract files from default deploy tar.gz file."
else
    echo "Extracting files from default deploy tar.gz file to /env/deploy ..."
    tar -zxf engine-deploy.tar.gz
    chown -R ssh_ovirt:ssh_ovirt /env/deploy

    echo "Extracting files from default ovirt-engine source code to /env/workspace ..."
    tar -zxf engine-src.tar.gz
    chown -R ssh_ovirt:ssh_ovirt /env/workspace
fi
exec "$@"