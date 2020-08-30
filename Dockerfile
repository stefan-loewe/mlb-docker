FROM python:3

RUN apt-get update
RUN apt-get -y install vim

RUN mkdir -p /data/
VOLUME [/data] 

RUN pip install mlbv
RUN pip install pytz

RUN mkdir -p /root/.config/
COPY bin/config /root/.config/mlbv/config

CMD bash

