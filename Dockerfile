FROM nginx

WORKDIR /app

COPY build/web /usr/share/nginx/html