FROM ghcr.io/kubernetize/alpine-service-base:3.22

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add dovecot dovecot-lmtpd dovecot-mysql dovecot-pgsql \
    dovecot-pigeonhole-plugin \
    dovecot-lua lua5.3-cjson && \
    adduser -h /vmail -s /bin/false -D -H -u 1000 vmail && \
    mkdir -p /run/dovecot /var/lib/dovecot && \
    chown vmail:vmail /run/dovecot /var/lib/dovecot && \
    chmod 700 /run/dovecot /var/lib/dovecot && \
    apk --no-cache add libcap && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/script-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/imap-urlauth-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/submission-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/managesieve-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/pop3-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/imap-login && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/lmtp && \
    setcap cap_sys_chroot+ep /usr/libexec/dovecot/anvil && \
    apk --no-cache del libcap

CMD ["/usr/sbin/dovecot", "-F"]
