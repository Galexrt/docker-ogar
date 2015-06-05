FROM gliderlabs/alpine:3.1
MAINTAINER Alexander T. <galexrt@googlemail.com>

ENV DATA_PATH="/data"
ADD docker-entrypoint.sh /
RUN apk --update add nodejs git && \
    mkdir -p "$DATA_PATH" && \
    cd "$DATA_PATH" && \
    git clone git://github.com/forairan/Ogar.git . && \
    npm install ws
WORKDIR "$DATA_PATH/src"
ENTRYPOINT ["/docker-entrypoint.sh"]
