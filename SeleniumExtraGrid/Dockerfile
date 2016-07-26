FROM dockerio.badoo.com/itops/sle_12_base:latest
MAINTAINER banuchka <banuchka@corp.badoo.com>

ADD s6-overlay-amd64.tar.gz /

ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

COPY java.repo /etc/zypp/repos.d/
COPY lsb.repo /etc/zypp/repos.d/
COPY x11.repo /etc/zypp/repos.d/

COPY google-chrome-stable_current_x86_64.rpm /root/
COPY jre-8u101-linux-x64.rpm /root/

RUN ln -snfv /usr/sbin/update-alternatives /usr/sbin/alternatives
RUN zypper -q -n --gpg-auto-import-keys --no-gpg-checks in /root/jre-8u101-linux-x64.rpm

RUN zypper -q -n --gpg-auto-import-keys --no-gpg-checks ref;\
	zypper --no-gpg-checks -q -n in bzip2 ca-certificates sudo unzip wget vim lsof xvfb-run /root/google-chrome-stable_current_x86_64.rpm
#java-1_9_0-openjdk-headless



#=================================
# Chrome Launch Script Modication
#=================================
COPY scripts/chrome_launcher.sh /opt/google/chrome/google-chrome
RUN chmod +x /opt/google/chrome/google-chrome

COPY SeleniumGridExtras-1.12.3-SNAPSHOT-jar-with-dependencies.jar /opt/selenium/
COPY SeleniumGridExtras/*.json /opt/selenium/
COPY SeleniumGridExtras/webdriver/ /tmp/webdriver/

COPY scripts/run-selenium-extra.sh /etc/services.d/selenium-extra/run
COPY scripts/os-prepare.sh /etc/cont-init.d/00-os-prepare.sh

RUN sudo useradd seluser --shell /bin/bash --create-home
RUN chown seluser -R /opt/selenium

ENTRYPOINT ["/init"]
