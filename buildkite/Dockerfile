FROM docker.io/buildkite/agent:3-ubuntu

RUN apt-get update && apt-get install -y podman fuse-overlayfs catatonit
COPY containers.conf /etc/containers/containers.conf
COPY storage.conf /etc/containers/storage.conf
COPY ./hooks /hooks
