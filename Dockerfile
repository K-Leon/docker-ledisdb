FROM expert/rocksdb:4.13
MAINTAINER unoexperto <unoexperto.support@mailnull.com>

EXPOSE 6380 11181

RUN apk add lua5.1 lua5.1-dev

# Compile and build LedisDB
RUN mkdir -p $GOPATH/src/github.com/siddontang && \
    cd $GOPATH/src/github.com/siddontang && \
    git clone https://github.com/unoexperto/ledisdb.git && \
    cd ledisdb && \
    ln -s ./cmd/vendor ./vendor && bash dev.sh && make && \
    mv ./bin/ledis* $GOPATH/bin/

RUN apk del build-base linux-headers git cmake bash

CMD $GOPATH/bin/ledis-server -config=/etc/ledisdb.conf