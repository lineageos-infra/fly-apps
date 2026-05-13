FROM buildkite/agent:3.126

RUN apk add --no-cache fuse-overlayfs podman
RUN mv /etc/containers/seccomp.json /usr/share/containers/seccomp.json

COPY containers.conf /etc/containers/containers.conf
COPY storage.conf /etc/containers/storage.conf
COPY ./hooks /hooks
