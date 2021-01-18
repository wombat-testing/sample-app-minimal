FROM alpine:3.12
COPY request-handler.sh /request-handler.sh
ENTRYPOINT ["nc", "-lk", "-p", "8080", "-e", "/request-handler.sh"]
