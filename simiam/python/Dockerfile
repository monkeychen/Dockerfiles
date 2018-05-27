FROM python:3.6-stretch

# Install uWSGI, Flask
RUN pip install uwsgi flask

# Copy the base uWSGI ini file to enable default dynamic uwsgi process number
COPY uwsgi.ini /etc/uwsgi/

# Install Supervisord
RUN apt-get update && apt-get install -y supervisor vim

# Custom Supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Which uWSGI .ini file should be used, to make it customizable
ENV UWSGI_INI /app/uwsgi.ini

ENV PYTHONPATH=/app

EXPOSE 5051

RUN mkdir /app && mkdir /app/logs
WORKDIR /app

CMD ["/usr/bin/supervisord"]