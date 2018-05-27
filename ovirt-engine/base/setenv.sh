#!/bin/bash

cd /env
tar -zxf apache-maven-3.5.3.tar.gz
rm -f apache-maven-3.5.3.tar.gz

echo "JAVA_HOME=$JAVA_HOME" >> /root/.bashrc
echo "MAVEN_HOME=$MAVEN_HOME" >> /root/.bashrc
echo 'PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH' >> /root/.bashrc
echo 'export JAVA_HOME MAVEN_HOME PATH' >> /root/.bashrc

echo "JAVA_HOME=$JAVA_HOME" >> /home/rcd/.bashrc
echo "MAVEN_HOME=$MAVEN_HOME" >> /home/rcd/.bashrc
echo 'PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH' >> /home/rcd/.bashrc
echo 'export JAVA_HOME MAVEN_HOME PATH' >> /home/rcd/.bashrc