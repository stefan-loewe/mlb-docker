FROM python:3


RUN mkdir -p /data/
VOLUME [/data] 

RUN pip install mlbstreamer
COPY bin/stream-dump.sh /
RUN mkdir -p /root/.config/mlbsteamer/
COPY bin/config.yaml /root/.config/mlbstreamer/config.yaml
CMD /stream-dump.sh

