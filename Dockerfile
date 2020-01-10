FROM alpine:3.11.2

RUN apk add --no-cache python3 curl
RUN pip3 install --upgrade pip
RUN pip3 --no-cache-dir install --upgrade awscli

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/darwin/amd64/aws-iam-authenticator \
    && chmod 0755 /usr/local/bin/aws-iam-authenticator \
    && chown root:root /usr/local/bin/aws-iam-authenticator

RUN apk update && apk add --no-cache ca-certificates gnupg
RUN wget https://github.com/mozilla/sops/releases/download/v3.5.0/sops-v3.5.0.linux -O /usr/local/bin/sops \
    && chmod 0755 /usr/local/bin/sops \
    && chown root:root /usr/local/bin/sops \
    && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.16.1/bin/linux/amd64/kubectl \
    && chmod 0755 /usr/local/bin/kubectl \
    && chown root:root /usr/local/bin/kubectl

RUN curl -L https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*
