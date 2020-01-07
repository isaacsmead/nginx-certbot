# Simple setup of an NGINX container with certbot

After playing around with mulit-container docker-compose projects I decided it's just simpler to just build up an NGINX base image with certbot and run though the certbot initialization process.  Dockefile is based on arm32v7 for use on Raspberry Pi 4.  

1. `docker build -t my-certbot-image .`
1. `docker volume create --name letsencrypt` or whatever name you want (for cert storage)
1. ``` bash
    docker container run  \
        -p 80:80 \
        -p 443:443 \
        -d \
        --name my-certbot-container \
        -v letsencrypt:/etc/letsencrypt \ 
        -v /path/to/here/conf.d:/etc/nginx/conf.d \
        my-certbot-image
    ```
1. From `/config.d` edit or replace `default.conf` by placing your domain name(s) in the *server_name* field.
1. certbot setup [reference](https://certbot.eff.org/lets-encrypt/debianbuster-nginx)
    1. exec into the running container and run: `certbot --nginx`
    1. follow instructions
    1. `certbot renew --dry-run`
1. Mody server config for specific hosting, proxy etc.  
