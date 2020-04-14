FROM bitnami/minideb

RUN sed -i -e "s/deb.debian/ftp.hk.debian/g" /etc/apt/sources.list

WORKDIR /opt/src

RUN install_packages iptables net-tools kmod \
	 xl2tpd strongswan

COPY ./run.sh /opt/src/run.sh

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
