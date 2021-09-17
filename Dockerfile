FROM nginxinc/nginx-unprivileged:1.21-alpine

COPY ./html /usr/share/nginx/html
