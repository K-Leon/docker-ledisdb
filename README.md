# Ledisdb Dockerfile

A docker image for https://github.com/siddontang/ledisdb with RocksDB. RocksDB is compiled with all compression libraries. LedisDB is compiled with LUA.

## Usage

Server:
```
$ docker run --name=ledisdb --restart=on-failure:3 -d  -p 127.0.0.1:6380:6380 -p 127.0.0.1:11181:11181 -v /host_data/etc/ledisdb.conf:/etc/ledisdb.conf -v /host_data:/data expert/ledisdb:4.13
```

Client:
```
$ docker run -it --rm --link ledisdb:ledisdb expert/ledisdb:4.13 ledis-cli -h ledisdb