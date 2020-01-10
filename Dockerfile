FROM alpine/helm:2.14.3

RUN apk update && apk add --no-cache ca-certificates gnupg curl
RUN wget https://github.com/mozilla/sops/releases/download/v3.5.0/sops-v3.5.0.linux -O /usr/local/bin/sops \
    && chmod 0755 /usr/local/bin/sops \
    && chown root:root /usr/local/bin/sops \
    && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN apk add --no-cache python3 
RUN pip3 install --upgrade pip
RUN pip3 --no-cache-dir install --upgrade awscli

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/darwin/amd64/aws-iam-authenticator \
    && chmod 0755 /usr/local/bin/aws-iam-authenticator \
    && chown root:root /usr/local/bin/aws-iam-authenticator \

ENTRYPOINT [""]
