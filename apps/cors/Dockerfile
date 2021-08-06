FROM nginx:1.17

COPY . /app
WORKDIR /app
ENTRYPOINT ["./entrypoint.sh", "/etc/nginx/conf.d"]
