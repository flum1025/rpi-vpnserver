FROM ubuntu:16.04

# require
RUN apt update && \
  apt install -y wget make gcc iputils-ping net-tools

# install SoftEther
RUN mkdir -p /tmp/se && \
  cd /tmp/se && \
  wget http://jp.softether-download.com/files/softether/v4.22-9634-beta-2016.11.27-tree/Linux/SoftEther_VPN_Server/32bit_-_ARM_EABI/softether-vpnserver-v4.22-9634-beta-2016.11.27-linux-arm_eabi-32bit.tar.gz && \
  tar zxvf softether-vpnserver-v4.22-9634-beta-2016.11.27-linux-arm_eabi-32bit.tar.gz && \
  cd /tmp/se/vpnserver && \
  yes 1 | make && \
  cd /tmp/se && \
  mv /tmp/se/vpnserver /usr/local && \
  cd /usr/local/vpnserver/ && \
  chmod 600 * && \
  chmod 700 vpncmd && \
  chmod 700 vpnserver && \
  rm -rf /tmp/se

CMD /usr/local/vpnserver/vpnserver start && tail -f /dev/null
