FROM alpine:3.18

RUN apk update
RUN apk --no-cache add git aws-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
