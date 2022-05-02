# !/user/bin/bash

/usr/sbin/iptables-restore < /etc/iptables/rules.v4
/usr/sbin/ip6tables-restore < /etc/iptables/rules.v6
/usr/sbin/openvpn --config $VPNCONFIG --daemon;
/usr/sbin/sshd -D;