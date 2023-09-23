FROM python:3.8

RUN apt-get update
RUN apt-get -y install vim

# RUN mkdir -p /data/
# VOLUME [/data] 

RUN git clone https://github.com/adam-ducker/mlbv
WORKDIR mlbv
RUN pip install .
RUN pip install pytz

RUN mkdir -p /root/.config/
COPY bin/config /root/.config/mlbv/config

WORKDIR ../data

CMD bash

