FROM alpine:3.16

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add gettext dovecot dovecot-lmtpd dovecot-mysql dovecot-pgsql

COPY assets/ /

CMD ["/usr/local/sbin/dovecot.sh"]
