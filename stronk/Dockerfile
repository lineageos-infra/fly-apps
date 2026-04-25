FROM python:3.10-alpine

COPY limnoria.patch /
COPY requirements.txt /
RUN apk add patch
RUN pip install -r /requirements.txt
RUN patch -p1 < /limnoria.patch
WORKDIR /data/stronk
CMD supybot --allow-root /data/Stronk.conf
