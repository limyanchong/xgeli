FROM alpine:3.17.0

RUN adduser -s /bin/sh -D xgeli0 && \
    echo "xgeli0:xgeli0" | chpasswd

USER xgeli0
RUN echo "the flag is {boJ9jbbUNNfktd78OOpsqOltutMc3MY1}" > ~/readme
