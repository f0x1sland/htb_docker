#
# Kali docker for htb labs with openvpn
#

# Kali image
FROM kalilinux/kali-rolling:latest
LABEL maintainer Eugene f0x1sland Dmitrenko <eugene.fox.dmitrenko@gmail.com>

# Arguments
ARG USERPASS=user

# Update default repos and tools, install tools/services
RUN apt-get update &&                               \
	apt-get upgrade -yy &&                          \
	apt-get install -yy systemctl                   \
                        procps                      \
                        iproute2                    \
                        iputils-ping                \
                        htop                        \
                        curl                        \
                        wget                        \
                        vim                         \
                        kali-linux-core             \
                        nmap                        \
                        masscan                     \
                        metasploit-framework        \
                        openvpn                     \
                        gobuster                    \
                        dnsutils                    \
                        hydra                       \
                        exploitdb                   \
                        python2.7-minimal           \
                        iptables                    

# not root user
RUN useradd -U -m -u 1337 -G sudo -p $(openssl passwd -1 $USERPASS) -s /bin/bash user                           \
# set random passwd for root (use only sudo)
&& echo "root:$(dd if=/dev/urandom bs=100 count=1 status=none | tr -dc 'a-zA-Z0-9~!@#$%^&*_-')" | chpasswd      \
&& mkdir /var/run/sshd                                                                                          \
# hide banner about python
&& touch /home/user/.hushlogin                                                                                  \ 
&& touch /root/.hushlogin                                                                                       \
# start tmux os SSH session
&& printf 'if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then                         \n\
    tmux -u attach-session -t ssh_tmux || tmux -u new-session -s ssh_tmux;                                    \n\
fi'                                                                                                             \
>> /home/user/.bashrc


CMD /usr/bin/bash /home/user/init.sh