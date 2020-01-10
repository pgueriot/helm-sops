FROM alpine/helm:2.14.3

RUN apk update && apk add --no-cache ca-certificates gnupg
RUN wget https://github.com/mozilla/sops/releases/download/v3.5.0/sops-v3.5.0.linux -O /usr/local/bin/sops \
    && chmod 0755 /usr/local/bin/sops \
    && chown root:root /usr/local/bin/sops \
    && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
