FROM dockerio.badoo.com/itops/sle_12_base:latest
MAINTAINER banuchka <banuchka@corp.badoo.com>

ADD s6-overlay-amd64.tar.gz /

RUN zypper -q -n --gpg-auto-import-keys --no-gpg-checks ref;\
	zypper --no-gpg-checks -q -n in bzip2 ca-certificates sudo unzip wget vim lsof 
RUN ln -snfv /usr/sbin/update-alternatives /usr/sbin/alternatives
COPY jre-8u101-linux-x64.rpm /root/
RUN zypper -q -n in /root/jre-8u101-linux-x64.rpm

COPY gridrouter-deb/target/jetty-runner.jar /opt/gridrouter/
COPY gridrouter-deb/target/grid-router-deb.war /opt/gridrouter/
COPY gridrouter-proxy-1.31-SNAPSHOT.war /opt/gridrouter/
COPY conf/etc/grid-router/ /etc/grid-router/ 

RUN mkdir /var/log/grid-router/

COPY scripts/os-prepare.sh /etc/cont-init.d/00-os-prepare.sh
COPY run-gridrouter.sh /etc/services.d/gridrouter/run

ENTRYPOINT ["/init"]
