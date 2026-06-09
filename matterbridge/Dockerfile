FROM golang:1.26-alpine AS builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@v4.3.3

RUN apk add --no-cache git
RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git checkout ee9fb2b03e467e82060e59f74ce9141d63f99b8b && \
    go build -tags goolm . && \
    cp matterbridge /go/bin/

FROM alpine:3.23

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl

CMD ["/usr/bin/start-matterbridge.sh"]
