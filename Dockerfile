FROM nextcloud:14.0.0-fpm
COPY redis.config.php /usr/src/nextcloud/config/redis.config.php

RUN apt-get update; \
apt-get install -y --no-install-recommends \
sudo \
supervisor \
curl \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /etc/supervisor/supervisord.conf

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false;

CMD ["/usr/bin/supervisord"]
