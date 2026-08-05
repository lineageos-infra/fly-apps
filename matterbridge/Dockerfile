FROM golang:1.26-alpine AS builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@v4.3.3

RUN apk add --no-cache git
RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git fetch origin 8431cbaf929c55cb3c0fc90f2afccec77cfb599d && \
    git checkout FETCH_HEAD && \
    go build -tags goolm . && \
    cp matterbridge /go/bin/

FROM alpine:3.24

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl

CMD ["/usr/bin/start-matterbridge.sh"]
