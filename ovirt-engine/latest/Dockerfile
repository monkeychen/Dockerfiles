FROM simiam/ovirt-engine:latest

MAINTAINER chenzhian <chenzhian@ruijie.com.cn>

USER root

WORKDIR /env

COPY entrypoint.sh start-engine-service.sh /env/

# RUN tar -zcf engine-src.tar.gz workspace
RUN tar -zcf engine-deploy.tar.gz deploy

RUN chmod a+x /env/entrypoint.sh
RUN chmod a+x /env/start-engine-service.sh
ENTRYPOINT [ "/env/entrypoint.sh" ]
