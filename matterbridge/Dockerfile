FROM golang:1.24-alpine AS builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@v4.3.3

RUN apk add --no-cache git
RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git checkout 02ff5e76c4fa12721e672adc257bf81a474db181 && \
    go build . && \
    cp matterbridge /go/bin/

FROM alpine:3.23

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl

CMD ["/usr/bin/start-matterbridge.sh"]
