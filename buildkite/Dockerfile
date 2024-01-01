FROM buildkite/agent:3-ubuntu

RUN apt-get update && apt-get install -y docker-ce containerd.io

RUN update-alternatives --set iptables /usr/sbin/iptables-legacy
RUN update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

COPY ./docker-entrypoint.d /docker-entrypoint.d
