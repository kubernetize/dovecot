FROM ghcr.io/kubernetize/alpine-service-base:3.19.1

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add dovecot dovecot-lmtpd dovecot-mysql dovecot-pgsql \
    dovecot-pigeonhole-plugin \
    dovecot-lua lua5.3-cjson

CMD ["/usr/sbin/dovecot", "-F"]
