## Buildstage ##
FROM golang:alpine3.17 as buildstage

WORKDIR /root-layer

COPY root/ /root-layer/

RUN <<EOF
	GOPATH="$PWD" go install github.com/metalmatze/transmission-exporter/cmd/transmission-exporter@latest
	mv bin/transmission-exporter bin/transmission-exporter-x86_64
	GOPATH="$PWD" GOOS=linux GOARCH=arm64 go install github.com/metalmatze/transmission-exporter/cmd/transmission-exporter@latest
	mv bin/linux_arm64/transmission-exporter bin/transmission-exporter-aarch64
	rm bin/linux_arm64 pkg -rf
EOF

## Single layer deployed image ##
FROM scratch

LABEL maintainer="simulatan"

# Add files from buildstage
COPY --from=buildstage /root-layer /
