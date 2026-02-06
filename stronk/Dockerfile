FROM python:3.10

COPY limnoria.patch /
COPY requirements.txt /
RUN pip install -r /requirements.txt
RUN patch -p1 < /limnoria.patch
WORKDIR /data/stronk
CMD supybot --allow-root /data/Stronk.conf
