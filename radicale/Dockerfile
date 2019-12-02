# Based on https://github.com/Kozea/Radicale/blob/master/Dockerfile
FROM alpine:latest

ARG VERSION=master
ARG USER=radicale

RUN apk add --no-cache \
      python3 \
      python3-dev \
      build-base \
      libffi-dev \
      ca-certificates \
      openssl \
      git

RUN wget --quiet https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz --output-document=radicale.tar.gz && \
    tar xzf radicale.tar.gz && \
    pip3 install ./Radicale-${VERSION}[md5,bcrypt] && \
    rm -r radicale.tar.gz Radicale-${VERSION}

RUN pip3 install passlib[bcrypt]

RUN apk del \
      python3-dev \
      build-base \
      libffi-dev

RUN adduser -HD ${USER}
RUN mkdir /data && chown ${USER}.${USER} /data
USER radicale

VOLUME /data
VOLUME /etc/radicale
EXPOSE 5232

CMD ["radicale", "--hosts", "0.0.0.0:5232"]