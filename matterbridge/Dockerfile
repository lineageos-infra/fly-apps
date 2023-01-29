FROM golang:1.17 as builder

WORKDIR /
RUN go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@v3.10.0
RUN go install github.com/DarthSim/hivemind@v1.0.6

RUN git clone https://github.com/lineageos-infra/matterbridge && \
    cd matterbridge && \
    git checkout 0740ec1c31121af78681aea9a32ef099d310a571 && \
    go build . && \
    cp matterbridge /go/bin/

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
