FROM alpine:3.17.2 AS server

COPY users.txt createuser .

RUN apk add --no-cache dropbear
RUN mkdir /etc/dropbear
RUN ./createuser users.txt
RUN rm users.txt createuser

USER xgeli0
RUN echo "The password is {boJ9jbbUNNfktd78OOpsqOltutMc3MY1}." > ~/README

USER xgeli1
RUN echo "The password is {CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9}." > ~/"password backup for someone.txt"

USER xgeli2
RUN echo "The password is {UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK}." > ~/-

FROM scratch
COPY --from=server / /

ENTRYPOINT ["dropbear", "-RF"]
CMD ["-p", "2220"]

EXPOSE 2220
