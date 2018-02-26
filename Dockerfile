FROM alpine:3.5

LABEL maintainer="Alexander Trost <galexrt@googlemail.com>"

ENV DATA_PATH="/data"

RUN apk --update add bash nodejs git && \
    mkdir -p "/data" && \
    git clone https://github.com/OgarProject/Ogar.git /data && \
    cd "/data" && \
    npm install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
