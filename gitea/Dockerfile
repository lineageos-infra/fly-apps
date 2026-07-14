FROM gitea/gitea:1.27.0

RUN apk add --no-cache python3 py3-requests
RUN rm -rf /etc/s6/openssh
COPY github-sync /etc/s6/github-sync
