FROM python:3

RUN mkdir -p /data/
VOLUME [/data] 

RUN pip install -U git+https://github.com/tonycpsu/mlbstreamer/

COPY bin/stream-dump.sh /

RUN mkdir -p /root/.config/mlbstreamer/
COPY bin/config.yaml /root/.config/mlbstreamer/config.yaml

CMD /stream-dump.sh

