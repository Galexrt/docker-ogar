FROM gliderlabs/alpine:3.1
MAINTAINER Alexander T. <galexrt@googlemail.com>

ENV DATA_PATH="/data" SERVER_USER="server" SERVER_GROUP="server"
RUN addgroup -S "$SERVER_GROUP" && \
    adduser -S -h "$DATA_PATH" -G "$SERVER_GROUP" "$SERVER_USER" && \
    apk --update add nodejs git && \
    cd "$DATA_PATH" && \
    git clone git://github.com/forairan/Ogar.git Ogar && \
    npm install ./Ogar && \
    chown -R "$SERVER_USER":"$SERVER_GROUP" "$DATA_PATH"
USER "$SERVER_USER"
ENTRYPOINT ["node", "Ogar"]
