FROM alpine:3.17.0

RUN apk add --update --no-cache dropbear && \
    mkdir /etc/dropbear && \
    dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key && \
    adduser -s /bin/sh -D xgeli0 && \
    echo "xgeli0:xgeli0" | chpasswd

USER xgeli0
RUN echo "the flag is {boJ9jbbUNNfktd78OOpsqOltutMc3MY1}" > ~/readme

USER root
ENTRYPOINT ["dropbear", "-F"]
CMD ["-p", "2220"]

EXPOSE 2220
