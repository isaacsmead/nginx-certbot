FROM arm32v7/nginx

RUN apt-get update \
    && apt-get install -y \
    certbot \
    python-certbot-nginx \
    && rm -rf /var/lib/apt/lists/* 

VOLUME /usr/share/nginx/html /etc/nginx/conf.d