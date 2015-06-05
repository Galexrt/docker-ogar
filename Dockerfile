FROM gliderlabs/alpine:3.1
MAINTAINER Alexander T. <galexrt@googlemail.com>

ENV DATA_PATH="/data"
RUN apk --update add nodejs git && \
    cd "$DATA_PATH" && \
    git clone git://github.com/forairan/Ogar.git Ogar && \
    npm install ws && \
    npm install ./Ogar
ENTRYPOINT ["node", "Ogar"]
