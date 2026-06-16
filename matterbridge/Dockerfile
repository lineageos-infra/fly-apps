FROM golang:1.26-alpine AS builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@v4.3.3

RUN apk add --no-cache git
RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git checkout 64e61733b0bdbe5ac72cbb10dc4525ba1a2b2d4e && \
    go build -tags goolm . && \
    cp matterbridge /go/bin/

FROM alpine:3.24

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl

CMD ["/usr/bin/start-matterbridge.sh"]
