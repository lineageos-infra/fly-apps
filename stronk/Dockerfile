FROM python:3.10

COPY requirements.txt /
RUN pip install -r /requirements.txt
WORKDIR /data/stronk
CMD supybot --allow-root /data/Stronk.conf
