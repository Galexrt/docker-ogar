FROM gliderlabs/alpine:3.2
MAINTAINER Alexander T. <galexrt@googlemail.com>

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh && \
    apk --update add bash nodejs git && \
    mkdir -p "/data" && \
    git clone git://github.com/OgarProject/Ogar.git /data && \
    cd "/data" && \
    npm install
ENTRYPOINT ["/entrypoint.sh"]
