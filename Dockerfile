FROM alpine:3.17.0 AS server

RUN apk add --no-cache dropbear
RUN mkdir /etc/dropbear
RUN dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
RUN adduser --shell /bin/sh --disabled-password xgeli0
RUN echo "xgeli0:xgeli0" | chpasswd
RUN adduser --shell /bin/sh --disabled-password xgeli1
RUN echo "xgeli1:boJ9jbbUNNfktd78OOpsqOltutMc3MY1" | chpasswd
RUN adduser --shell /bin/sh --disabled-password xgeli2
RUN echo "xgeli2:CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9" | chpasswd

USER xgeli0
RUN echo "The password is {boJ9jbbUNNfktd78OOpsqOltutMc3MY1}." > ~/README

USER xgeli1
RUN echo "The password is {CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9}." > ~/"password backup for someone.txt"

USER xgeli2
RUN echo "The password is {UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK}." > ~/-

FROM scratch
COPY --from=server / /

ENTRYPOINT ["dropbear", "-F"]
CMD ["-p", "2220"]

EXPOSE 2220
