FROM eavatar/basebox

ADD run.sh /run.sh
RUN chmod a+x /run.sh
ADD https://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip
RUN mkdir -p /data/consul /config

ADD ./config /config/
ONBUILD ADD ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
ENV SHELL /bin/bash
ENTRYPOINT ["/run.sh"]
CMD []