## Buildstage ##
FROM golang:alpine3.17 as buildstage

WORKDIR /root-layer

COPY root/ /root-layer/

RUN GOPATH="$PWD" go install github.com/metalmatze/transmission-exporter/cmd/transmission-exporter@latest

## Single layer deployed image ##
FROM scratch

LABEL maintainer="simulatan"

# Add files from buildstage
COPY --from=buildstage /root-layer /
