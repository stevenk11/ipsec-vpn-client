FROM debian:buster-slim 

RUN sed -i -e "s/deb.debian/ftp.hk.debian/g" /etc/apt/sources.list

WORKDIR /opt/src

RUN apt-get update && apt-get install -y --no-install-recommends \
	iptables net-tools kmod \
	xl2tpd strongswan \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY ./run.sh /opt/src/run.sh

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
