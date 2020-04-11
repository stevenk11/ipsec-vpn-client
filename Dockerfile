FROM debian:sid-slim

WORKDIR /opt/src

RUN apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -y --no-install-recommends install \
         dnsutils openssl ca-certificates kmod \
         iproute2 gawk grep sed net-tools iptables \
         bsdmainutils libcurl3-nss \
	 xl2tpd strongswan rsyslog ppp libpcap0.8

COPY ./run.sh /opt/src/run.sh

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
