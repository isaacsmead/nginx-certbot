FROM nginx:1.21

RUN apt-get update \
    && apt-get install -y certbot python3-certbot-nginx \
    && rm -rf /var/lib/apt/lists/* 

VOLUME /usr/share/nginx/html /etc/nginx/conf.d