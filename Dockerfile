FROM eavatar/basebox

ADD run.sh /run.sh
RUN chmod a+x /run.sh
RUN wget http://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip -O /tmp/consul.zip &&\
    cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip &&\
    wget http://dl.bintray.com/mitchellh/consul/0.5.0_web_ui.zip -O /tmp/webui.zip &&\
    mkdir /ui && cd /ui && unzip /tmp/webui.zip && rm /tmp/webui.zip && mv dist/* . && rm -rf dist

RUN mkdir -p /data/consul /config

ADD ./config /config/
ONBUILD ADD ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
ENV SHELL /bin/bash
ENTRYPOINT ["/run.sh"]
CMD []