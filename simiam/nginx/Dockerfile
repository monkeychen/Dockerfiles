FROM nginx:1.9.0

RUN apt-get update && apt-get install -y vim

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/
ADD  ssl/*    /root/
RUN  mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx
RUN  chown -R www-data.www-data /opt/htdocs /opt/log

EXPOSE 80
EXPOSE 443
VOLUME ["/opt"]

