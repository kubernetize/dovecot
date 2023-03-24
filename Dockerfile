FROM ghcr.io/kubernetize/alpine-service-base:3.17.2

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add dovecot dovecot-lmtpd dovecot-mysql dovecot-pgsql

CMD ["/usr/sbin/dovecot", "-F"]
