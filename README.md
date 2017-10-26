# rpi-vpnserver

VPN server on docker for the Raspberry Pi.

## Getting Started

### Build

    $ git clone https://github.com/flum1025/rpi-vpnserver.git
    $ cd rpi-vpnserver
    $ docker build -t vpnserver .
    
### Configuration

#### Command Line

    $ docker run -it --name vpnserver-tmp -p 500:500/udp -p 4500:4500/udp --net host --cap-add NET_ADMIN vpnserver bash
    $ /usr/local/vpnserver/vpnserver start
    $ /usr/local/vpnserver/vpncmd # Set Vpn Server
    
    VPN connection confirmation and Exit docker container
    
    $ docker cp vpnserver-tmp:/usr/local/vpnserver/vpn_server.config ./
    
#### Use VPN Server Manager

    $ docker run -it --name vpnserver-tmp -p 500:500/udp -p 4500:4500/udp --net host --cap-add NET_ADMIN vpnserver bash
    $ /usr/local/vpnserver/vpnserver start
    
    Configure VPN using VSM and VPN connection confirmation and Exit docker container
    
    $ docker cp vpnserver-tmp:/usr/local/vpnserver/vpn_server.config ./
    
### Run

    $ docker run -d -p 500:500/udp -p 4500:4500/udp --net host --cap-add NET_ADMIN vpnserver
