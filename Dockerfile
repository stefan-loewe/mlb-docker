FROM python:3

RUN apt-get update
RUN apt-get -y install vim

RUN mkdir -p /data/
VOLUME [/data] 

RUN pip install -U git+https://github.com/stefan-loewe/mlbstreamer/
RUN pip install requests_toolbelt

COPY bin/stream-dump.sh /

RUN mkdir -p /root/.config/mlbstreamer/
COPY bin/config.yaml /root/.config/mlbstreamer/config.yaml

CMD /stream-dump.sh

