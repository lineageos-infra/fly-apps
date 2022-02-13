FROM golang:1.17 as builder

WORKDIR /
RUN go install github.com/lineageos-infra/matterbridge@0f45185570280974e60b6b8bf29deb6ac1a64442
RUN go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@v3.10.0
RUN go install github.com/DarthSim/hivemind@v1.0.6

FROM ubuntu:focal

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge
COPY --from=builder /go/bin/hivemind /bin/hivemind

RUN apt update && apt install -y ca-certificates

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY Procfile Procfile
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl
RUN chmod +x /usr/bin/start-matterbridge.sh

CMD ["/bin/hivemind"]
