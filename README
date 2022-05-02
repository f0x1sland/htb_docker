## Solve Hack the box in docker

#### How to use
```
git clone
cd htb_docker
```
Copy htb vpn config to `config` dir
Open file `docker-compose.yml`: 
- set a variable `USERPASS` for not root user
- change `<FILE_VPN_CONF_NAME>` to htb vpn config file name.

```
docker-compose up -d
ssh -D 8081 user@127.0.0.1
```
You'll have SOCKS5 proxy on 8081 port for burp, any browser, etc on host machine.

### Advanced
You can add to `/etc/hosts` line `htb.docker    127.0.0.1` and connect to ssh as `ssh ssh -D 8081 user@htb.docker`
Also, you can set `~/.ssh/config` add follow config:
```
Host htb.docker
    User user
    Port 22
    DynamicForward 8081
```
and connect to container as `ssh htb-docker`