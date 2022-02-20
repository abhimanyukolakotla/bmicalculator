FROM quay.io/bitnami/nginx

WORKDIR /app

COPY build/web /usr/share/nginx/html