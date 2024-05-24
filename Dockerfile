FROM alpine:3.18

RUN apk update --no-cache
RUN apk add --no-cache git aws-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
