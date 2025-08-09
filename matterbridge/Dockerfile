FROM golang:1.24 AS builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@v4.3.3
RUN go install github.com/DarthSim/hivemind@v1.1.0

RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git checkout a5b39066657394ec502c021d52e3479687ec6c70 && \
    go build . && \
    cp matterbridge /go/bin/

FROM ubuntu:plucky

COPY --from=builder /go/bin/gomplate /bin/gomplate
COPY --from=builder /go/bin/matterbridge /bin/matterbridge
COPY --from=builder /go/bin/hivemind /bin/hivemind

RUN apt update && apt install -y ca-certificates

COPY start-matterbridge.sh /usr/bin/start-matterbridge.sh
COPY Procfile Procfile
COPY matterbridge.toml.tpl /etc/matterbridge.toml.tpl
RUN chmod +x /usr/bin/start-matterbridge.sh

CMD ["/bin/hivemind"]
