FROM gliderlabs/alpine:3.1
MAINTAINER Alexander T. <galexrt@googlemail.com>

ENV DATA_PATH="/data"
RUN apk --update add nodejs git && \
    mkdir -p "$DATA_PATH" && \
    cd "$DATA_PATH" && \
    git clone git://github.com/forairan/Ogar.git Ogar && \
    npm install ws
WORKDIR "$DATA_PATH/Ogar/src"
ENTRYPOINT ["node", "index.js"]
