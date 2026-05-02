FROM gitea/gitea:1.26.1

RUN apk add python3 py3-requests
RUN rm -rf /etc/s6/openssh
COPY github-sync /etc/s6/github-sync
