FROM ghcr.io/kubernetize/alpine-service-base

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add dovecot dovecot-lmtpd dovecot-mysql dovecot-pgsql

CMD ["/usr/sbin/dovecot", "-F"]
