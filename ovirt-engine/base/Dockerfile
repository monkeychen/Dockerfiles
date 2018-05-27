FROM centos:7.4.1708

MAINTAINER chenzhian <chenzhian@ruijie.com.cn>

USER root

# Create diretories and copy files
RUN mkdir -p /env/.m2/repository
RUN mkdir -p /env/workspace
COPY setup_ssh_user.sh setenv.sh ovirt_engine_make_setup.sh enterpoint.sh /
COPY apache-maven-3.5.3.tar.gz /env

# Change yum.repos.d
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum -y --nogpgcheck install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum -y --nogpgcheck install http://resources.ovirt.org/pub/yum-repo/ovirt-release42.rpm
RUN yum makecache

# Install ssh-server, JDK8, Postgresql
RUN yum -y --nogpgcheck install vim passwd openssl openssh-server java-1.8.0-openjdk-devel git \
    postgresql96-server postgresql96-contrib postgresql96-devel \
    m2crypto python-psycopg2 python-cheetah python-daemon libxml2-python \
    unzip pyflakes python-pep8 mailcap python-jinja2 python-dateutil bind-utils
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN chmod a+x /setup_ssh_user.sh
RUN /setup_ssh_user.sh rcd rcd

# start sshd for: ssh -p 10022 ssh_ovirt@ovirt-engine-dev
RUN nohup /usr/sbin/sshd -D &

# Set environments
ENV JAVA_HOME /etc/alternatives/java_sdk_1.8.0
ENV MAVEN_HOME /env/apache-maven-3.5.3

RUN chmod a+x /setenv.sh
RUN /setenv.sh

RUN yum -y --nogpgcheck install ovirt-engine-wildfly ovirt-engine-wildfly-overlay
RUN yum -y --nogpgcheck install ovirt-host-deploy ovirt-setup-lib ovirt-js-dependencies

# Init database config if necessary
RUN /usr/pgsql-9.6/bin/postgresql96-setup initdb


RUN chmod a+x /ovirt_engine_make_setup.sh
RUN /ovirt_engine_make_setup.sh

RUN chmod a+x /enterpoint.sh
CMD [ "/enterpoint.sh" ]
