FROM centos:8

MAINTAINER Yauri Attamimi <yauritux@gmail.com>

ENV NODE_VERSION 12.18.2
ENV ARCH x64
ENV CHECKSUM b8dc634798ee783482c2ae1755bd7dff09d83fa7bb037cdc370b601d0a5e5cbb

RUN dnf install -y gcc-c++ make openssl-devel

RUN if [ -n "${CHECKSUM}" ]; then \
  set -eu; \
  curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz"; \
  echo "$CHECKSUM node-v$NODE_VERSION-linux-$ARCH.tar.xz" | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs; \
  else \
    echo "Installing from Package" \
    && curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo dnf install nodejs; \
  fi \
  && rm -f "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  # smoke tests
  && node --version \
  && npm --version

WORKDIR /usr/local/bin

COPY docker-entrypoint.sh .
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node"]
