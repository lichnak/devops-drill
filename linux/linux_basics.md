# Linux and commands

Many fruitfull snippets for GNU/Linux enrironments.

Most of the tooling comes from coreutils <https://www.gnu.org/software/coreutils/>

## Grub

Simple bootloader.

If you need simpler bootloader try U-boot <https://source.denx.de/u-boot/u-boot>

```bash
password --md5 $l$2FXKzQO$I6k7iy22wB27CrkzdVPe70 /boot/grub/admlnistrator-menu.lst

cat <<"EOF"> /etc/grub. conf
default=l

timeout=10

splashimage=(hdO,0)/grub/splash.xptri.gz
password --mds $l$2FXKzQO$I6k7iy22wB27CrkzdVPe70
title Red Hat Linux (2.6.7)
lock

root (hdOjO)

kernel /vmlinuz-2.6.7 ro root=LABEL=/

Initrd /lnitrd-2.6.7.itrg
EOF

cat <<"EOF"> /etc/grub. conf
title Red Hat Linux (2.6.7)
password --mdS $l$2QO$I6k7iy22wB27CrkzdVPe70

root (hdOjO)

kernel /vmlinuz-2.6.7 ro root=LABEL=/

Initrd /lnitrd-2.6.7.img
EOF

chown root:root /etc/grub. conf
chmod 0600 /etc/grub. conf

awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
uname -a
grub2-set-default 1
grub2-mkconfig -o /boot/grub2/grub.cfg
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
reboot
uname -a
package-cleanup --oldkernels --count=1
yum clean all
df -hT
```

## Init Scripts

SysV init scripts typically living in/and so on/rc.d/init.d/

The following runlevels exist:

- 0 — Halt
- 1 — Single-user mode
- 2 — Not used (user-definable)
- 3 — Full multi-user mode
- 4 — Not used (user-definable)
- 5 — Full multi-user mode (with an X-based login screen)
- 6 — Reboot

### Centos/Rhel

```bash
chkconfig --list
chkconfig --del no/we
chkconfig --add name

chown root:root /etc/rc.d/init.d/*
chmod -R 700 /etc/rc.d/init.d/*
```

### Debian

```bash
update-rc.d network defaults
update-rc.d network defaults 20 80
update-rc.d network start 20 2 3 4 5 . stop 20 0 1 6 .
update-rc.d network remove

rm -f /etc/init.d/network

update-rc.d network remove

chown root: root /etc/init.d/*
chmod -R 700 /etc/init. d/*
```

### Inittab

```bash
/etc/inittab

servicename:runlevels:label:command -option -option

id:5:initdefault:
sysacc:235:acct:/usr/sbln/acct -q -d
:S:walt:/sbin/sulogln
ca: :ctrlaltdel:/sbin/shutdown -t3 -r now

1 : 2345 : respawn : /sbin/mingetty ttyl
2 : 2345 : respawn : /sbin/mingetty tty2
```

## Systemd

Nothing mouch yet. TBD

## Teletype TTY

```bash
cat /etc/security/access.conf

chown root:root /etc/securetty
chmod 0600 /etc/securetty

ls -1 /etc/security/console.apps/

rpm -Uvh vlock-l-3-i3.i386.rpm

vlock -c

vlock -a

clear > /etc/issue
clear > /etc/issue.net

chown root:root /etc/issue /etc/issue.net /etc/motd
chmod 0600 /etc/issue /etc/issue.net /etc/motd
```

## User and Groups

```bash
who
last
id
useradd
groupadd
sudo
```

### Users

```bash
passwd command
su command
sulogin command
getent command
login command
pwck command
pwunconv command
chpasswd command
chsh command
chfn command
useradd command
userdel command

/etc/passwd
username : password : UID : GID : GECOS : Home Directory : Shell

root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt

id -G
id -G user
id -G lichnak
grep -w '^tom' /etc/passwd
```

```bash
# !/bin/bash
# seven fields from /etc/passwd stored in $f1,f2...,$f7
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
 echo "User $f1 use $f7 shell and stores files in $f6 directory."
done < /etc/passwd
```

/etc/shadow file fields:

- Username : It is your login name.
- Password : It is your encrypted password. The password should be minimum 8-12 characters long including special characters, digits, lower case alphabetic and more. Usually password format is set to $id$salt$hashed, The $id is the algorithm used On GNU/Linux as follows:
- $1$ is MD5
- $2a$ is Blowfish
- $2y$ is Blowfish
- $5$ is SHA-256
- $6$ is SHA-512
- Last password change (lastchanged) : Days since Jan 1, 1970 that password was last changed
- Minimum : The minimum number of days required between password changes i.e. the number of days left before the user is allowed to change his/her password
- Maximum : The maximum number of days the password is valid (after that user is forced to change his/her password)
- Warn : The number of days before password is to expire that user is warned that his/her password must be changed
- Inactive : The number of days after password expires that account is disabled
- Expire : days since Jan 1, 1970 that account is disabled i.e. an absolute date specifying when the login may no longer be used.

```bash
pwck -r /etc/passwd
pwck -r /etc/shadow
pwck [options] /etc/shadow
```

### Groups

```bash
/etc/group
groupname : password : GID : member,member

root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
adm:x:4:
tty:x:5:
disk:x:6:
lp:x:7:
mem:x:8:
kmem:x:9:
wheel:x:10:lichnak,mpi,jirik,tomash

useradd bob

cat /etc/default/useradd

useradd -s /sbin/noshell -C mail, clam -d /var/spool/amavls amavis

groupadd sales

gpasswd -a bob sales
gpasswd -A bob sales

gpasswd -A bob -M jane chrls david sales
gpasswd sales
```

### PAM

/etc/pam.d/passwd

```bash
cat <<"EOF"> /etc/pam.d/passwd
account required pam_unlx.so
password required pam_cracklib. so retry=3 minlen=10 dcredit=-l ucredit=-l ocredit=-l lcredit=0 difok=3
password required pam_unix.so use_authtok remetrber=5 nullok mds
EOF

touch /etc/security/opasswd
chown root:root /etc/security/opasswd
chmod 0644 /etc/security/opasswd

cat /etc/pam.d/passwd
```

### Password policies

- /etc/security/opasswd
- /etc/pam.d/common-password

auth        sufficient    pam_unix.so likeauth nullok
password    sufficient   pam_unix.so remember=4

The PAM module offers a pam_cracklib that protects your server from dictionary and brute-force attacks.
To accomplish this task, open the file /etc/pam.d/system-auth using any text editor and add the following line:

/lib/security/$ISA/pam_cracklib.so retry=3 minlen=8 lcredit=-1 ucredit=-2 dcredit=-2 ocredit=-1

auth required pam_env.so
auth required pam_faillock.so preauth audit silent deny=5 unlock_time=604800
auth [success=1 default=bad] pam_unix.so
auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=604800
auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=604800
auth required pam_deny.so

```bash
/usr/sbin/faillock --user <userlocked>  --reset
```

The next tip for enhancing the passwords policies is to restrict access to the su command by setting the pam_wheel.so parameters in “/etc/pam.d/su”:

auth required pam_wheel.so use_uid
The final tip for passwords policy is to disable the system accounts for non-root users by using the following bash script:

```bash
# !/bin/bash
for user in `awk -F: '($3 < 500) {print $1 }' /etc/passwd`; do
if [ $user != "root" ]
then
/usr/sbin/usermod -L $user
if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]
then /usr/sbin/usermod -s /sbin/nologin $user
fi
fi
done
```

```bash
chage -M 30 bob
chage bob
chage -1 bob

cat /etc/login.defs

# Password aging controls
#
# PASS_MAX_DAYS   Maximum number of days a password may be used
# PASS_MIN_DAYS   Minimum number of days allowed between password changes
# PASS_MIN_LEN    Minimum acceptable password length
# PASS_WARN_AGE   Number of days warning given before a password expires
#

PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_MIN_LEN    5
PASS_WARN_AGE   7

/etc/security/pwquality.conf

difok = 5
minlen = 8
minclass = 1
maxrepeat = 0
maxclassrepeat = 0
lcredit = -1
ucredit = 0
dcredit = -1
ocredit = -1
gecoscheck = 1

/etc/pam.d/system-auth
ls -la /etc/pam.d/
cat /etc/pam.d/passw
passwd            password-auth     password-auth-ac

cat /etc/pam.d/passwd
# %PAM-1.0
auth       include      system-auth
account    include      system-auth
password   substack     system-auth
-password   optional    pam_gnome_keyring.so use_authtok
password   substack     postlogin
```

### Sudo policies

```bash
puppy$ cat /var/log/secure
cat: /var/log/secure: Permission denied
puppy$ sudo cat /var/log/secure
Password:

bob ALL=/bin/cat,/sbin/shutdown,/sbin/poweroff

useradd rottenflesh
sudo cat <<"EOF"> /etc/sudoers.d/40-rottenflesh
rottenflesh ALL=(ALL)       ALL
EOF
su rottenflesh
mkdir -m 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
cat <<"EOF"> ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAicaYwBc+Pa2XCZSxLQpozQr0FrIAqGN2quhm5n03oskb67fS/mhKuCNhwtozaXQrqlj0AKLtln/wp51dGdrKV1ZROtjs0PaMWUdSe8hWRauy3LO3oC0sQCbRiatuIYsH+2J2vZBqm05/KoY2XDcSMzKdNwprnAqo0InN1CzHKvTHCku8seXuOtAUrzmkAC4QjP+GDMQgHF90FhN0EvvKOXdrXo+n7+nAM3QDxLh4YarYIN8aThSmvvMSNYqzw45AwDeeFZZT1jOxMIAv4nby171Bag4o9FT4WOxiK0f0/quJOoX9+a9/Ab/csly/Zn57CotkoiDftZYg+VcfRF0gPfrwW68PzIf1PxvXn7pLhwAMDy15BbZKF/b29EXrgoKGum9t2x9ntqSwCXNNNt7pARw4ehQhGftHUcaQt2pHOIUE/EEMIiKp+P2xhIAbsAzeyIT2ytHHStaUXKhaoWRdW/QapGiwl6TNUBEc+FzyN2yPeIX/8tRYU3b6v5cvA9KJ0NNGSlHVV1ghodET8GcVnlswv3wbL/kFEQQGDiD9N1fxBrhKzN39i2tZVcGMO0gZVZSRYrZBUld/D0kHu72MdZ8yovTnuevJ4Ob1Fmb2iI5RdUcgM1+JjYPmXeitE0wigfjcx7LcGxh+jixFSWqC2Svb+WiLxyfFjh4Fd9mi0Ts= rsa-key-20171228
EOF
chmod 600 ~/.ssh/authorized_keys
exit
passwd rottenflesh
vi /etc/ssh/sshd_config

systemctl restart sshd.service
```

### Logging Sessions

```bash
last

touch /var/log/wtmp /var/log/btmp
chown root:root /var/log/wtmp /var/log/btmp
chmod 0644 /var/log/wtmp /var/log/btmp

lastlog

touch /var/log/lastlog
chown root:root /var/log/lastlog
chmod 0644 /var/log/lastlog

<http://www.lbiblio.org/pub/linux/system/admin/accounts/acct-l-3.73.tar.gz>
cp acctentries accton accttrim dumpact lastcomm /usr/local/sbin
touch /var/log/pacct
chown root:root /var/log/pacct
chmod 0644 /var/log/pacct
/usr/local/sbin/accton /var/log/pacct

lastcomm -f /var/log/pacct
lastcomm -f /var/log/pacct --user bob
```

## Networking

Netfilter is a stateful packet-filtering firewall. Two types of packet-filtering firewalls exist:
stateful and stateless. A stateless packet-filtering firewall examines only the header of a packet
for filtering information. It sees each packet in isolation and thus has no way to determine if
a packet is part of an existing connection or an isolated malicious packet. A stateful firewall
maintains information about the status of the connections passing through it. This allows the
firewall to filter on the state of the connection, which offers considerably finer-grained control
over your traffic.

Netfilter is controlled and configured in user space by the Iptables command. In previ-
ous versions of the Linux kernel, other commands provided this functionality. In kernel ver-
sion 2.2 it was Ipchalns, and inversion 2.0 it was ipfwadm. I cover the iptables command in
this chapter, and I will frequently use this name to refer to the firewall technology in general.
Most Linux-based distributions will have an iptables package, but they may also have their
own tool for configuring the rules. Some of these may be worth looking into, but they may not
be easy to use for more complicated configurations or may make dangerous configuration
assumptions.

### Network interfaces

```bash
ifup-aliases

chown root:root /etc/services
chmod 0644 /etc/services
chattr +1 /etc/services

/sbin/service network status
system-config-network-cmd -e > /tmp/network-config
system-config-network-cmd -i -c -f /tmp/network-config

/etc/hosts
/etc/resolv.conf
/etc/sysconfig/network
/sbin/ifdown and /sbin/ifup
/etc/sysconfig/network-scripts/network-functions
```

#### /etc/sysconfig/network-scripts/ifcfg-interface-name

BOOTPROTO=<protocol>
    where <protocol> is one of the following:
        none — No boot-time protocol should be used.
        bootp — The BOOTP protocol should be used.
        dhcp — The DHCP protocol should be used.

BROADCAST=<address>
where <address> is the broadcast address. This directive is deprecated, as the value is calculated automatically with ifcalc.

DEVICE=<name>
where <name> is the name of the physical device (except for dynamically-allocated PPP devices where it is the logical name).

DHCP_HOSTNAME
Use this option only if the DHCP server requires the client to specify a hostname before receiving an IP address.

DNS{1,2}=<address>
where <address> is a name server address to be placed in /etc/resolv.conf if the PEERDNS directive is set to yes.

ETHTOOL_OPTS=<options>
where <options> are any device-specific options supported by ethtool. For example, if you wanted to force 100Mb, full duplex:

ETHTOOL_OPTS="autoneg off speed 100 duplex full"
Note
Changing speed or duplex settings almost always requires disabling autonegotiation with the autoneg off option. This needs to be stated first, as the option entries are order-dependent.

GATEWAY=<address>
where <address> is the IP address of the network router or gateway device (if any).

HWADDR=<MAC-address>
where <MAC-address> is the hardware address of the Ethernet device in the form AA:BB:CC:DD:EE:FF. This directive is useful for machines with multiple NICs to ensure that the interfaces are assigned the correct device names regardless of the configured load order for each NIC's module. This directive should not be used in conjunction with MACADDR.

IPADDR=<address>
where <address> is the IP address.

MACADDR=<MAC-address>
where <MAC-address> is the hardware address of the Ethernet device in the form AA:BB:CC:DD:EE:FF. This directive is used to assign a MAC address to an interface, overriding the one assigned to the physical NIC. This directive should not be used in conjunction with HWADDR.

MASTER=<bond-interface>
where <bond-interface> is the channel bonding interface to which the Ethernet interface is linked.

This directive is used in conjunction with the SLAVE directive.

Refer to Section 13.2.3, “Channel Bonding Interfaces” for more information about channel bonding interfaces.

NETMASK=<mask>
where <mask> is the netmask value.

NETWORK=<address>
where <address> is the network address. This directive is deprecated, as the value is calculated automatically with ifcalc.

ONBOOT=<answer>
where <answer> is one of the following:

yes — This device should be activated at boot-time.

no — This device should not be activated at boot-time.

PEERDNS=<answer>
where <answer> is one of the following:

yes — Modify /etc/resolv.conf if the DNS directive is set. If using DHCP, then yes is the default.

no — Do not modify /etc/resolv.conf.

SLAVE=<bond-interface>
where <bond-interface> is one of the following:

yes — This device is controlled by the channel bonding interface specified in the MASTER directive.

no — This device is not controlled by the channel bonding interface specified in the MASTER directive.

This directive is used in conjunction with the MASTER directive.

Refer to Section 13.2.3, “Channel Bonding Interfaces” for more about channel bonding interfaces.

SRCADDR=<address>
where <address> is the specified source IP address for outgoing packets.

USERCTL=<answer>
where <answer> is one of the following:

yes — Non-root users are allowed to control this device.

no — Non-root users are not allowed to control this device.

#### /etc/sysconfig/network-scripts/ifcfg-ipsec1

DST=<address>
where <address> is the IP address of the IPsec destination host or router. This is used for both host-to-host and network-to-network IPsec configurations.

DSTNET=<network>
where <network> is the network address of the IPsec destination network. This is only used for network-to-network IPsec configurations.

SRC=<address>
where <address> is the IP address of the IPsec source host or router. This setting is optional and is only used for host-to-host IPsec configurations.

SRCNET=<network>
where <network> is the network address of the IPsec source network. This is only used for network-to-network IPsec configurations.

TYPE=<interface-type>
where <interface-type> is IPSEC. Both applications are part of the ipsec-tools package.

If manual key encryption with IPsec is being used, refer to /usr/share/doc/initscripts-<version-number>/sysconfig.txt (replace <version-number> with the version of the initscripts package installed) for configuration parameters.

The racoon IKEv1 key management daemon negotiates and configures a set of parameters for IPSec. It can use preshared keys, RSA signatures, or GSS-API. If racoon is used to automatically manage key encryption, the following options are required:

IKE_METHOD=<encryption-method>
where <encryption-method> is either PSK, X509, or GSSAPI. If PSK is specified, the IKE_PSK parameter must also be set. If X509 is specified, the IKE_CERTFILE parameter must also be set.

IKE_PSK=<shared-key>
where <shared-key> is the shared, secret value for the PSK (preshared keys) method.

IKE_CERTFILE=<cert-file>
where <cert-file> is a valid X.509 certificate file for the host.

IKE_PEER_CERTFILE=<cert-file>
where <cert-file> is a valid X.509 certificate file for the remote host.

IKE_DNSSEC=<answer>
where <answer> is yes. The racoon daemon retrieves the remote host's X.509 certificate via DNS. If a IKE_PEER_CERTFILE is specified, do not include this parameter.

### iptables

- Table(s)
- Chains PREROUTING POSTROUTING INPUT OUTPUT FORWARD
- Policies DROP REJECT ACCEPT

**iptables packet flow:**

```bash
PACKET IN --->---PREROUTING---[ routing ]--->----FORWARD---->---POSTROUTING--->--- PACKET OUT
                   - mangle        |              - mangle        - mangle
                   - nat (dst)     |              - filter        - nat (src)
                                   |                                 |
                                   |                                 |
                                 INPUT                            OUTPUT
                                  - mangle                         - mangle
                                  - filter                         - nat (dst)
                                  |                                - filter
                                  |                                 |
                                  `---->----[ application ]---->----'
```

```bash
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -L INPUT -n -v
iptables -L OUTPUT -n -v --line-numbers

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -L INPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers | less
iptables -L OUTPUT -n --line-numbers | grep 202.54.1.1

iptables -I INPUT 2 -s 202.54.1.2 -j DROP

iptables -A OUTPUT -d 192.168.1.0/24 -j DROP
iptables -A OUTPUT -o eth1 -d 192.168.1.0/24 -j DROP

service iptables save

iptables-restore < /root/my.active.firewall.rules

whois 69.171.228.40 | grep CIDR

iptables -A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above 3 -j REJECT
iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 20 --connlimit-mask 24 -j DROP

iptables -t nat -v -L -n --line-number
iptables -t nat -v -L PREROUTING -n --line-number
iptables -t nat -v -L POSTROUTING -n --line-number

iptables -t nat -D PREROUTING {number-here}
iptables -t nat -D PREROUTING 42

iptables -t nat -D POSTROUTING {number-here}
iptables -t nat -D POSTROUTING 42
```

#### Stateless firewall

```bash
cat <<"EOF"> stateless-firewall.sh

# !/bin/bash

# Load the connection tracker kernel module
modprobe ip_conntrack

# Flush the iptables rules
iptables -F

# Set the default policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Create a necessary chains
iptables -N LOG_ACCEPT
iptables -N LOG_REJECT
iptables -N LOG_DROP
iptables -N IN_SSH

# Allow established connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Allow traffic on loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Drop traffic with invalid states
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Allow icmp ping
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

# For SSH traffic jump in the IN_SSH chain
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j IN_SSH

# Allow web services
iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW -j LOG_ACCEPT
iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW -j LOG_ACCEPT

# Protect the SSH against brute force attacks
iptables -A IN_SSH -m recent --name sshbf --rttl --rcheck --hitcount 3 --seconds 10 -j DROP
iptables -A IN_SSH -m recent --name sshbf --rttl --rcheck --hitcount 4 --seconds 1800 -j DROP
iptables -A IN_SSH -m recent --name sshbf --set -j LOG_ACCEPT

# Chain for logging of accepted traffic
iptables -A LOG_ACCEPT -j LOG --log-prefix "INPUT:ACCEPT:" --log-level 6
iptables -A LOG_ACCEPT -j ACCEPT

# Chain for logging of rejected traffic
iptables -A LOG_REJECT -j LOG --log-prefix "INPUT:REJECT:" --log-level 6
iptables -A LOG_REJECT -p tcp -j REJECT --reject-with tcp-reset   # TCP traffic will be rejected with the RST packet
iptables -A LOG_REJECT -p udp -j REJECT --reject-with icmp-port-unreachable # UDP traffic will be rejected with ICMP message Port Unreachable
iptables -A LOG_REJECT -j REJECT --reject-with icmp-proto-unreachable   # Protocols other than TCP/UDP will be rejected with ICMP message Protocol Unreachable

# Chain for logging of dropped traffic
iptables -A LOG_DROP -j LOG --log-prefix "INPUT:DROP:" --log-level 6
iptables -A LOG_DROP -j DROP
EOF
```

## File Systems

1. / – Root
2. /bin – User Binaries
3. /sbin – System Binaries
4. /etc – Configuration Files
5. /dev – Device Files
6. /proc – Process Information
7. /var – Variable Files
8. /tmp – Temporary Files
9. /usr – User Programs
10. /home – Home Directories
11. /boot – Boot Loader Files
12. /lib – System Libraries
13. /opt – Optional add-on Applications
14. /mnt – Mount Directory
15. /media – Removable Media Devices
16. /srv – Service Data

```bash
/boot
/dev/pts
/dev/shm
/dev/cdrom
/mnt/cdrom
/proc
/sys
swap
```

### Files

```bash
find / -nouser -o -nogroup -Is
find / -type b -or -type c
find / -type f -perm +6000 -is
find / -name -print -xdev

du -cks * | sort -rn | head
find . -xdev -type f -size +250M -exec ls -l {} \;
fuser -uv log.log
lsof -p PID
less /etc/init.d/process
ls -l /var/lock/subsys/ | grep process
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10
ps -eo pcpu,pid,user,args | sort -r -k1 | less
mount -o loop iso_name mount_dir

chattr -V +1 /etc/passwd
```

### LVM

```bash
fdisk -l
tail -f /var/log/message  
ls /sys/class/scsi_host/ | while read host ; do echo "- - -" > /sys/class/scsi_host/$host/scan ; done
fdisk -l
cat /etc/fstab
vgs  
vgdisplay local
pvcreate /dev/sd*
pvscan
vgextend local /dev/sd*
lvdisplay /dev/local/data  
lvextend -L +20G /dev/mapper/local-data
resize2fs  -p /dev/mapper/local-data  
lvdisplay /dev/local/data
vgdisplay local
df -h /data

symdisk -sid 1234 list

for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{print ""}' $file; done | sort -k 2 -n -r | less

ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'

/etc/fstab
UUID=b5f67448-de92-4287-a8ec-7307d2f77ff5 /                       ext4    defaults,noatime,nodiratime        1 1
UUID=00c219be-fd48-4499-bd16-45593e2c8f7b /boot                   ext4    defaults,noatime,nodiratime        1 2

cryptsetup options action name device

cryptsetup -y create safe /dev/loopO
```

## GPG

```bash
gpg --version
 ~/.gnupg

gpg -c -a --cipher-algo BLOWFISH test.txt
gpg -c -a -0 test2. encrypted test.txt
```

## Logging

```bash
(date; uname -a)
script -a penetration_log.txt
(ps -aux; ps -auxeww; lsof) > current_procs.txt
tar -cvpf proc_dlrectory .tar /proc/[0-9]*
(date; uname -a; netstat -p; netstat -rn; arp -v) > network_status.txt
dd bs=1024 < /dev/mem > mem
dd bs=1024 < /dev/kmem > kmem
dd if=/dev/hdal bs=1024 > hdal

/etc/rc.d/init.d/syslog-ng reload

/etc/syslog-ng/syslog-ng.conf
source s_sys ! unix-streatr("/dev/log" max-connections(20)); internal(); };
source s_tcp { tcp(lp(l92. 168.0.1) port(514) max-connectlons(l5)); };
source s_udp { udp(); };
```

## Cron

```bash
        * ** ** "příkaz ke spuštění"

- - - - -
| | | | |
| | | | ----- Den v týdnu (0 - 7) (Neděle=0 nebo 7)
| | | ------- Měsíc (1 - 12)
| | --------- Den v měsíci (1 - 31)
| ----------- Hodina (0 - 23)
------------- Minuta (0 - 59)
```

```bash
/etc/anacrontab
/etc/crontab
/etc/cron.*

chown root:root /etc/anacrontab
chmod og-rwx /etc/anacrontab
chown root:root /etc/crontab
chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d
chown root:root <crontabfile>
chmod og-rwx <crontabfile>
chmod 644 /etc/passwd
chown root:root /etc/passwd
chmod 644 /etc/group
chown root:root /etc/group
chmod 600 /etc/shadow
chown root:root /etc/shadow
chmod 600 /etc/gshadow
chown root:root /etc/gshadow

# dump crontab konfigurace
mujcrontab=mujcrontab
crontab -l > $mujcrontab

# přidat nový záznam do cron dumpu
echo "00 09 ** 1-5 echo hello" >> $mujcrontab

# instalace nového crontab souboru
crontab $mujcrontab
rm $mujcrontab

SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin
MAILTO=root
HOME=/

# nginx letsencrypt certbot ssl a crontab
55 2 ** * certbot renew --quiet --post-hook "systemctl reload nginx"

# apache2 letsencrypt certbot ssl a crontab
55 2 ** * certbot renew --quiet --post-hook "systemctl reload httpd"

# script "run-parts" spousti ulohy ulozene v adresari danem jako parametr
01 **** root run-parts /etc/cron.hourly
02 4 ***root run-parts /etc/cron.daily
22 4**0 root run-parts /etc/cron.weekly
42 4 1** root run-parts /etc/cron.monthly

# Testovaci blbost spoustena kazdou minutu
        * * * * *               root    echo "Test mail pro roota"

# Delej neco kazdou lichou hodinu kazdy sudy den
- 1-23/2 */2* *        root    /usr/local/sbin/delej_neco

# Zalohovani dat 1 x tydne v noci z patku na sobotu (v 0:42)
42 0 ** 6              root    /usr/local/sbin/zal_data_tyden

# Zalohovani dat 1 x mesicne prvniho v 0:42
42 0 1 **              root    /usr/local/sbin/zal_data_mesic

# Stazeni aktualizace neceho v Po-Pá v 5:45 a zaslani vystupu petrovi a pavlovi
MAILTO=petr,pavel
45 5 ** 1-5            root    /usr/local/sbin/myDB_update

# a MAILTO znovu nastavim na puvodni hodnotu (jinak bych tohle musel dat nakonec)
MAILTO=root

# upozorneni na obed (11:58 priprava, 12:00 odchod)
58 11 ***root    /usr/local/bin/obed_priprava
0 12***              root    /usr/local/bin/obed_odchod

# jakas synchronizace casu systemu denne v 5:58, 11:58 a 17:58, vystup potlacen
58 5,11,17 ** *        root    /usr/local/sbin/nastav_date &gt;/dev/null

# Monitorovani teploty a ventilatoru kazdych 5 minut
*/5* ** *             root    /usr/local/sbin/test_teplota

# Monitorovani prostoru na disku od 6:11 do 19:51 Pondeli-Patek
11,31,51 6-19 ** 1-5   root    /usr/local/sbin/test_disk_full

# Priklad vybirani posty skolnim serverem
# leden-cerven, zari-prosinec:    Po - Pa v 6:30 a 11:00
# So, Ne v 18:00

30 6  *1-6,9-12 1-5    root    /usr/local/sbin/inet_mail
0 11* 1-6,9-12 1-5     root    /usr/local/sbin/inet_mail
0 18 *1-6,9-12 6,7     root    /usr/local/sbin/inet_mail

# a cervenec, srpen:      Po, St, Pa v 6:20
20 6* 7,8 1,3,5        root    /usr/local/sbin/inet_mail
```

## OpenSSH

```bash
ssh username@penguin.example.net
ssh penguin.example.net ls /usr/share/doc

scp <localfile> username@tohostname:<remotefile>
scp shadowman username@penguin.example.net:shadowman
scp downloads/* username@penguin.example.net:uploads/

ssh -Y <user>@example.com
ssh -L local-port:remote-hostname:remote-port username@hostname
ssh -L 1100:mail.example.com:110 mail.example.com

ssh-keygen -t rsa
chmod 755 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
```

System-wide SSH configuration information is stored in the /etc/ssh/ directory:

- moduli — Contains Diffie-Hellman groups used for the Diffie-Hellman key exchange which is critical for constructing a secure transport layer. When keys are exchanged at the beginning of an SSH session, a shared, secret value is created which cannot be determined by either party alone. This value is then used to provide host authentication.
- ssh_config — The system-wide default SSH client configuration file. It is overridden if one is also present in the user's home directory (~/.ssh/config).
- sshd_config — The configuration file for the sshd daemon.
- ssh_host_dsa_key — The DSA private key used by the sshd daemon.
- ssh_host_dsa_key.pub — The DSA public key used by the sshd daemon.
- ssh_host_key — The RSA private key used by the sshd daemon for version 1 of the SSH protocol.
- ssh_host_key.pub — The RSA public key used by the sshd daemon for version 1 of the SSH protocol.
- ssh_host_rsa_key — The RSA private key used by the sshd daemon for version 2 of the SSH protocol.
- ssh_host_rsa_key.pub — The RSA public key used by the sshd for version 2 of the SSH protocol.

User-specific SSH configuration information is stored in the user's home directory within the ~/.ssh/ directory:

- authorized_keys — This file holds a list of authorized public keys for servers. When the client connects to a server, the server authenticates the client by checking its signed public key stored within this file.
- id_dsa — Contains the DSA private key of the user.
- id_dsa.pub — The DSA public key of the user.
- id_rsa — The RSA private key used by ssh for version 2 of the SSH protocol.
- id_rsa.pub — The RSA public key used by ssh for version 2 of the SSH protocol
- identity — The RSA private key used by ssh for version 1 of the SSH protocol.
- identity.pub — The RSA public key used by ssh for version 1 of the SSH protocol.
- known_hosts — This file contains DSA host keys of SSH servers accessed by the user. This file is very important for ensuring that the SSH client is connecting the correct SSH server.

```bash
ssh-keygen -t rsa -b 4096
ssh-keygen -t dsa 
ssh-keygen -t ecdsa -b 521
ssh-keygen -t ed25519

ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.0.88.18
ssh-keygen -f "/home/lichnak/.ssh/known_hosts" -R "10.0.88.8"

onstartload ()
{
 cd ~ && eval $(ssh-agent) && ssh-add && clear
}
```

```bash
cat <<"EOF"> /etc/ssh/sshd_banner
###############################################
## Vitejete na lichnak.cz                    ##
###############################################
EOF

cat <<"EOF"> /etc/ssh/sshd_config
# If you want to change the port on a SELinux system, you have to tell
# SELinux about this change
# semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
#
Port 22
# AddressFamily any
# ListenAddress 0.0.0.0
# ListenAddress
# The default requires explicit activation of protocol 1
Protocol 2
# HostKey for protocol version 1
# HostKey /etc/ssh/ssh_host_key
# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
# HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
# Lifetime and size of ephemeral version 1 server key
# KeyRegenerationInterval 1h
# ServerKeyBits 1024
# Ciphers and keying
# RekeyLimit default none
# Logging
# obsoletes QuietMode and FascistLogging
# SyslogFacility AUTH
SyslogFacility AUTHPRIV
LogLevel DEBUG
# Authentication
LoginGraceTime 5m
PermitRootLogin no
# StrictModes yes
MaxAuthTries 3
MaxSessions 4
AllowUsers lichnak
# RSAAuthentication yes
PubkeyAuthentication yes
# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile      .ssh/authorized_keys
# AuthorizedPrincipalsFile none
# AuthorizedKeysCommand none
# AuthorizedKeysCommandUser nobody
# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
# RhostsRSAAuthentication no
# similar for protocol version 2
# HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# RhostsRSAAuthentication and HostbasedAuthentication
# IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
# IgnoreRhosts yes
# To disable tunneled clear text passwords, change to no here
# PasswordAuthentication yes
# PermitEmptyPasswords no
PasswordAuthentication no
# Change to no to disable s/key passwords
# ChallengeResponseAuthentication yes
ChallengeResponseAuthentication no
# Kerberos options
# KerberosAuthentication no
# KerberosOrLocalPasswd yes
# KerberosTicketCleanup yes
# KerberosGetAFSToken no
# KerberosUseKuserok yes
# GSSAPI options
GSSAPIAuthentication no
GSSAPICleanupCredentials no
# GSSAPIStrictAcceptorCheck yes
# GSSAPIKeyExchange no
# GSSAPIEnablek5users no
# Set this to 'yes' to enable PAM authentication, account processing
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password"
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'
# WARNING: 'UsePAM no' is not supported in Red Hat Enterprise Linux and may cause several
# problems
UsePAM no
# AllowAgentForwarding yes
# AllowTcpForwarding yes
# GatewayPorts no
X11Forwarding yes
# X11DisplayOffset 10
# X11UseLocalhost yes
# PermitTTY yes
PrintMotd yes
PrintLastLog yes
# TCPKeepAlive yes
# UseLogin no
UsePrivilegeSeparation sandbox          # Default for new installations.
# PermitUserEnvironment no
# Compression delayed
# ClientAliveInterval 0
# ClientAliveCountMax 3
# ShowPatchLevel no
UseDNS yes
# PidFile /var/run/sshd.pid
# MaxStartups 10:30:100
# PermitTunnel no
# ChrootDirectory none
# VersionAddendum none
# no default banner path
Banner /etc/ssh/sshd_banner
# Accept locale-related environment variables
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS
# override default of no subsystems
Subsystem       sftp    /usr/libexec/openssh/sftp-server
# Example of overriding settings on a per-user basis
# Match User anoncvs
# X11Forwarding no
# AllowTcpForwarding no
# PermitTTY no
# ForceCommand cvs server
EOF
```

## PXE

### Bind and Dhcpd

```bash
man named.conf
man rndc.conf

## DNS Bind Master
yum install bind bind-utils -y
systemctl enable named
mkdir /var/log/named
chown named:named /var/log/named
chmod 0700 /var/log/name

# Master
rndc-confgen -a -b 512 -r /dev/urandom 
chown root:named /etc/rndc.key
chmod 0640 /etc/rndc.key

cat <<"EOF"> /etc/named.conf
include "/etc/named.rfc1912.zones";
include "/etc/named.root.key";
include "/etc/rndc.key";

# Allow rndc management
controls {
    inet 127.0.0.1 port 953 allow { 127.0.0.1; } keys { "rndc-key"; };
};

# Limit access to local network and sfc LAN
acl "clients" {
    127.0.0.0/8;
    10.0.0.0/9;
};

options {
    listen-on port 53 { 127.0.0.1; 10.0.0.16; }; ## MASTER
    listen-on-v6 { none; };
    directory     "/var/named";
    dump-file     "/var/named/data/cache_dump.db";
    statistics-file "/var/named/data/named_stats.txt";
    memstatistics-file "/var/named/data/named_mem_stats.txt";

    tcp-clients 50;

    # Disable built-in server information zones
    version none;
    hostname none;
    server-id none;

    recursion yes;
    recursive-clients 50;
    allow-recursion { clients; };
    allow-query { clients; };
    allow-transfer { localhost; 10.0.0.18; }; ## SLAVE

    auth-nxdomain no;
    notify no;
    dnssec-enable yes;
    dnssec-validation auto;
    dnssec-lookaside auto;

    bindkeys-file "/etc/named.iscdlv.key";
    managed-keys-directory "/var/named/dynamic";
    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";
};

# Specifications of what to log, and where the log messages are sent
logging {
    channel "common_log" {
        file "/var/log/named/named.log" versions 10 size 5m;
        severity dynamic;
        print-category yes;
        print-severity yes;
        print-time yes;
    };
    category default { "common_log"; };
    category general { "common_log"; };
    category queries { "common_log"; };
    category client { "common_log"; };
    category security { "common_log"; };
    category query-errors { "common_log"; };
    category lame-servers { null; };
};

zone "." IN {
    type hint;
    file "named.ca";
};

# Internal zone definitions
zone "home.lichnak.cz" {
    type master;
    file "data/db.home.lichnak.cz";
    allow-update { key rndc-key; };
    notify yes;
};

zone "0.0.10.in-addr.arpa" {
    type master;
    file "data/db.0.0.10";
    allow-update { key rndc-key; };
    notify yes;
};
EOF

cat <<"EOF">/var/named/data/db.home.lichnak.cz
\$TTL 86400    ; 1 day
@            IN SOA    zloutek.home.lichnak.cz. root.home.lichnak.cz. (
                2018010700 ; Serial
                3600       ; Refresh (1 hour)
                3600       ; Retry (1 hour)
                604800     ; Expire (1 week)
                3600       ; Minimum (1 hour)
)
@        NS    zloutek.home.lichnak.cz.
@        NS    bilek.home.lichnak.cz.
@        A    10.0.0.16
@        A    10.0.0.18
behak         A    10.0.0.34
bidlo         A    10.0.0.21
bilek         A    10.0.0.18
branka        A    10.0.0.3
chocholka     A    10.0.0.44
hnizdo        A    10.0.0.35
jatka         A    10.0.0.26
kohout        A    10.0.0.8
kukatko       A    10.0.0.24
kuratko       A    10.0.0.7
kure-mgt      A    10.0.0.11
kure          A    10.0.0.12
kure-rsa      A    10.0.0.13
kurice        A    10.0.0.31
kurinec       A    10.0.0.17
kurnik        A    10.0.0.14
kurnik-ilo    A    10.0.0.37
kvocna        A    10.0.0.23
nosnice       A    10.0.0.32
ostruha       A    10.0.0.33
parat         A    10.0.0.30
partnamedvedy A    10.0.0.39
pastnakuny    A    10.0.0.15
pastnalisky   A    10.0.0.36
pastnamouchy  A    10.0.0.41
pastnavlky    A    10.0.0.38
petlice       A    10.0.0.27
podestylka    A    10.0.0.25
podkladek     A    10.0.0.42
sklopec       A    10.0.0.43
slama         A    10.0.0.22
slepice       A    10.0.0.10
snuska        A    10.0.0.29
sojka         A    10.0.0.20
vajicko       A    10.0.0.19
vchod         A    10.0.0.2
vybeh         A    10.0.0.28
zloutek       A    10.0.0.16
zrni          A    10.0.0.40
zumpa         A    10.0.0.1
tester        A    10.0.0.60
EOF

cat<<"EOF"> /var/named/data/db.0.0.10
\$TTL 86400    ; 1 day
@            IN SOA    zloutek.home.lichnak.cz. root.home.lichnak.cz. (
                2018010700 ; Serial
                3600       ; Refresh (1 hour)
                3600       ; Retry (1 hour)
                604800     ; Expire (1 week)
                3600       ; Minimum (1 hour)
)
@        NS    zloutek.home.lichnak.cz.
@        NS    bilek.home.lichnak.cz.
@        PTR    sfc.13cybertech.cz.
zloutek      A    10.0.0.16
bilek        A    10.0.0.18
34    PTR    behak.home.lichnak.cz.
21    PTR    bidlo.home.lichnak.cz.
18    PTR    bilek.home.lichnak.cz.
3     PTR    branka.home.lichnak.cz.
44    PTR    chocholka.home.lichnak.cz.
35    PTR    hnizdo.home.lichnak.cz.
26    PTR    jatka.home.lichnak.cz.
8     PTR    kohout.home.lichnak.cz.
24    PTR    kukatko.home.lichnak.cz.
7     PTR    kuratko.home.lichnak.cz.
11    PTR    kure-mgt.home.lichnak.cz.
12    PTR    kure.home.lichnak.cz.
13    PTR    kure-rsa.home.lichnak.cz.
31    PTR    kurice.home.lichnak.cz.
17    PTR    kurinec.home.lichnak.cz.
14    PTR    kurnik.home.lichnak.cz.
37    PTR    kurnik-ilo.home.lichnak.cz.
23    PTR    kvocna.home.lichnak.cz.
32    PTR    nosnice.home.lichnak.cz.
33    PTR    ostruha.home.lichnak.cz.
30    PTR    parat.home.lichnak.cz.
39    PTR    partnamedvedy.home.lichnak.cz.
15    PTR    pastnakuny.home.lichnak.cz.
36    PTR    pastnalisky.home.lichnak.cz.
41    PTR    pastnamouchy.home.lichnak.cz.
38    PTR    pastnavlky.home.lichnak.cz.
27    PTR    petlice.home.lichnak.cz.
25    PTR    podestylka.home.lichnak.cz.
42    PTR    podkladek.home.lichnak.cz.
43    PTR    sklopec.home.lichnak.cz.
22    PTR    slama.home.lichnak.cz.
10    PTR    slepice.home.lichnak.cz.
29    PTR    snuska.home.lichnak.cz.
20    PTR    sojka.home.lichnak.cz.
19    PTR    vajicko.home.lichnak.cz.
2     PTR    vchod.home.lichnak.cz.
28    PTR    vybeh.home.lichnak.cz.
16    PTR    zloutek.home.lichnak.cz.
40    PTR    zrni.home.lichnak.cz.
1     PTR    zumpa.home.lichnak.cz.
60    PTR    tester.home.lichnak.cz.
EOF

sestatus
chown named:named /var/named/data/db.home.lichnak.cz /var/named/data/db.0.0.10 
semanage fcontext -a -t named_zone_t /var/named/data/db.home.lichnak.cz
semanage fcontext -a -t named_zone_t /var/named/data/db.0.0.10 
restorecon -Rv /var/named/
setsebool -P named_write_master_zones=1

named-checkconf /etc/named.conf
named-checkzone home.lichnak.cz /var/named/data/db.home.lichnak.cz
named-checkzone home.lichnak.cz /var/named/data/db.0.0.10 

systemctl start named
systemctl enable named

named-checkzone home.lichnak.cz /var/named/data/db.home.lichnak.cz
named-checkzone home.lichnak.cz /var/named/data/db.0.0.10 

rndc status
dig @10.0.0.16 ns home.lichnak.cz
dig @10.0.0.16 a sojka.home.lichnak.cz

## DHCP
yum install dhcp
systemctl enable dhcpd

cat <<"EOF"> /etc/dhcp/dhcpd.conf
failover peer "failover-dhcp" {
  primary; # This defines the master
  address 10.0.0.16;
  port 647;
  peer address 10.0.0.18;
  peer port 647;
  max-response-delay 60;
  max-unacked-updates 10;
  mclt 3600;
  split 128; # 128 is balanced; use 255 if primary is 100% responsible until failure
  load balance max seconds 3;
}

authoritative;
allow booting;
allow bootp;
next-server 10.0.0.19; # Katello TFTP
filename "pxelinux.0";
default-lease-time 86400; # 1 day
max-lease-time 86400; # 1 day

ddns-update-style interim;

update-static-leases on;
one-lease-per-client on;

# We generated the rndc-key when setting up DNS servers
key "rndc-key" {
        algorithm hmac-md5;
        secret "A4sHbtl9mWwgI44oEzOn6kH869cHb8YYqZv5Qv9DL4UJWolKETiGi0wYvqIWk3w2N5zKREAgA1+GYak5co161w==";
};

# We created zones when setting up DNS servers
zone 0.0.10.in-addr.arpa {
  primary 10.0.0.16;
  key "rndc-key";
}
zone home.lichnak.cz {
  primary 10.0.0.16;
  key "rndc-key";
}

subnet 10.0.0.0 netmask 255.128.0.0 {
  option subnet-mask 255.128.0.0;
  option broadcast-address 10.127.255.255;
  option routers 10.0.0.1;
  option domain-name-servers zloutek.home.lichnak.cz, bilek.home.lichnak.cz;
  option domain-search "home.lichnak.cz";
  pool {
    failover peer "failover-dhcp";
    range 10.0.0.80 10.0.0.99;
  }
}

# DHCP leases for PXE boot
host kure {
  hardware ethernet 00:21:5E:C4:69:30;
  fixed-address 10.0.0.11;
  option host-name "kure.home.lichnak.cz";
}
host kohout {
  hardware ethernet 6C:62:6D:C9:E0:0C;
  fixed-address 10.0.0.8;
  option host-name "kohout.home.lichnak.cz";
}
host zumpa {
  hardware ethernet 00:26:55:D9:C3:8D;
  fixed-address 10.0.0.1;
  option host-name "zumpa.home.lichnak.cz";
}
host pastnakuny {
  hardware ethernet 52:54:00:03:2B:BD;
  fixed-address 10.0.0.15;
  option host-name "pastnakuny.home.lichnak.cz";
}
host zloutek {
  hardware ethernet 52:54:00:C7:27:6B;
  fixed-address 10.0.0.16;
  option host-name "zloutek.home.lichnak.cz";
}
host kurinec {
  hardware ethernet 00:15:5D:3D:C0:07;
  fixed-address 10.0.0.17;
  option host-name "kurinec.home.lichnak.cz";
}
host bilek {
  hardware ethernet 52:54:00:07:41:93;
  fixed-address 10.0.0.18;
  option host-name "bilek.home.lichnak.cz";
}
host vajicko {
  hardware ethernet 52:54:00:58:4B:79;
  fixed-address 10.0.0.19;
  option host-name "vajicko.home.lichnak.cz";
}
host sojka {
  hardware ethernet 00:15:5D:0B:D3:1E;
  fixed-address 10.0.0.20;
  option host-name "sojka.home.lichnak.cz";
}
host bidlo {
  hardware ethernet 52:54:00:07:41:95;
  fixed-address 10.0.0.21;
  option host-name "bidlo.home.lichnak.cz";
}
host slama {
  hardware ethernet 52:54:00:07:41:96;
  fixed-address 10.0.0.22;
  option host-name "slama.home.lichnak.cz";
}
host kvocna {
  hardware ethernet 52:54:00:07:41:97;
  fixed-address 10.0.0.23;
  option host-name "kvocna.home.lichnak.cz";
}
host kukatko {
  hardware ethernet 52:54:00:07:41:99;
  fixed-address 10.0.0.24;
  option host-name "kukatko.home.lichnak.cz";
}
host podestylka {
  hardware ethernet 52:54:00:07:41:98;
  fixed-address 10.0.0.25;
  option host-name "podestylka.home.lichnak.cz";
}
host jatka {
  hardware ethernet 52:54:00:7F:93:26;
  fixed-address 10.0.0.26;
  option host-name "jatka.home.lichnak.cz";
}
host petlice {
  hardware ethernet 52:54:00:26:65:5E;
  fixed-address 10.0.0.27;
  option host-name "petlice.home.lichnak.cz";
}
host vybeh {
  hardware ethernet 52:54:00:07:42:00;
  fixed-address 10.0.0.28;
  option host-name "vybeh.home.lichnak.cz";
}
host behak {
  hardware ethernet 52:54:00:A2:1D:E8;
  fixed-address 10.0.0.34;
  option host-name "behak.home.lichnak.cz";
}
host tester {
  hardware ethernet 52:54:00:C7:27:6C;
  fixed-address 10.0.0.60;
  option host-name "tester.home.lichnak.cz";
}
EOF

chmod 0600 /etc/dhcp/dhcpd.conf
dhcpd -t -cf /etc/dhcp/dhcpd.conf
systemctl restart dhcpd
tail /var/lib/dhcpd/dhcpd.leases

## DNS Bind Slave
yum install bind bind-utils -y
systemctl enable named
mkdir /var/log/named
chown named:named /var/log/named
chmod 0700 /var/log/name

cat <<"EOF"> /etc/named.conf
include "/etc/named.rfc1912.zones";
include "/etc/named.root.key";

# Limit access to local network and sfc LAN
acl "clients" {
    127.0.0.0/8;
    10.0.0.0/9;
};

options {
    listen-on port 53 { 127.0.0.1; 10.0.0.18; }; ## SLAVE
    listen-on-v6 { none; };
    directory     "/var/named";
    dump-file     "/var/named/data/cache_dump.db";
    statistics-file "/var/named/data/named_stats.txt";
    memstatistics-file "/var/named/data/named_mem_stats.txt";

    tcp-clients 50;

    # Disable built-in server information zones
    version none;
    hostname none;
    server-id none;

    recursion yes;
    recursive-clients 50;
    allow-recursion { clients; };
    allow-query { clients; };
    allow-transfer { none }; ## SLAVE

    auth-nxdomain no;
    notify no;
    dnssec-enable yes;
    dnssec-validation auto;
    dnssec-lookaside auto;

    bindkeys-file "/etc/named.iscdlv.key";
    managed-keys-directory "/var/named/dynamic";
    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";
};

# Specifications of what to log, and where the log messages are sent
logging {
    channel "common_log" {
        file "/var/log/named/named.log" versions 10 size 5m;
        severity dynamic;
        print-category yes;
        print-severity yes;
        print-time yes;
    };
    category default { "common_log"; };
    category general { "common_log"; };
    category queries { "common_log"; };
    category client { "common_log"; };
    category security { "common_log"; };
    category query-errors { "common_log"; };
    category lame-servers { null; };
};

zone "." IN {
    type hint;
    file "named.ca";
};

# Internal zone definitions
zone "home.lichnak.cz" {
    type slave;
    file "data/db.home.lichnak.cz";
    masters { 10.0.0.16; };
    allow-notify { 10.0.0.16; };
};

zone "0.0.10.in-addr.arpa" {
    type slave;
    file "data/db.0.0.10";
    masters { 10.0.0.16; };
    allow-notify { 10.0.0.16; };
};
EOF

restorecon -Rv /var/named/
setsebool -P named_write_master_zones=1

named-checkconf /etc/named.conf
named-checkzone home.lichnak.cz /var/named/data/db.home.lichnak.cz
named-checkzone home.lichnak.cz /var/named/data/db.0.0.10 

systemctl start named
systemctl enable named


named-checkzone home.lichnak.cz /var/named/data/db.home.lichnak.cz
named-checkzone home.lichnak.cz /var/named/data/db.0.0.10 

rndc status
dig @10.0.0.16 ns home.lichnak.cz
dig @10.0.0.16 a sojka.home.lichnak.cz

nsupdate -k /etc/rndc.key

rndc freeze home.lichnak.cz
rndc reload home.lichnak.cz
rndc thaw home.lichnak.cz

## DHCP Slave
yum install dhcp
systemctl enable dhcpd

cat <<"EOF"> /etc/dhcp/dhcpd.conf
failover peer "failover-dhcp" {
  secondary; # This defines the slave
  address 10.0.0.18;
  port 647;
  peer address 10.0.0.16;
  peer port 647;
  max-response-delay 60;
  max-unacked-updates 10;
  load balance max seconds 3;
}

authoritative;
allow booting;
allow bootp;
next-server 10.0.0.19; # Katello TFTP
filename "pxelinux.0";
default-lease-time 86400; # 1 day
max-lease-time 86400; # 1 day

ddns-update-style interim;

update-static-leases on;
one-lease-per-client on;

# We generated the rndc-key when setting up DNS servers
key "rndc-key" {
        algorithm hmac-md5;
        secret "A4sHbtl9mWwgI44oEzOn6kH869cHb8YYqZv5Qv9DL4UJWolKETiGi0wYvqIWk3w2N5zKREAgA1+GYak5co161w==";
};

# We created zones when setting up DNS servers
zone 0.0.10.in-addr.arpa {
  primary 10.0.0.16;
  key "rndc-key";
}
zone home.lichnak.cz {
  primary 10.0.0.16;
  key "rndc-key";
}

subnet 10.0.0.0 netmask 255.128.0.0 {
  option subnet-mask 255.128.0.0;
  option broadcast-address 10.127.255.255;
  option routers 10.0.0.1;
  option domain-name-servers zloutek.home.lichnak.cz, bilek.home.lichnak.cz;
  option domain-search "home.lichnak.cz";
  pool {
    failover peer "failover-dhcp";
    range 10.0.0.80 10.0.0.99;
  }
}
# DHCP leases for PXE boot
host kure {
  hardware ethernet 00:21:5E:C4:69:30;
  fixed-address 10.0.0.11;
  option host-name "kure.home.lichnak.cz";
}
host kohout {
  hardware ethernet 6C:62:6D:C9:E0:0C;
  fixed-address 10.0.0.8;
  option host-name "kohout.home.lichnak.cz";
}
host zumpa {
  hardware ethernet 00:26:55:D9:C3:8D;
  fixed-address 10.0.0.1;
  option host-name "zumpa.home.lichnak.cz";
}
host pastnakuny {
  hardware ethernet 52:54:00:03:2B:BD;
  fixed-address 10.0.0.15;
  option host-name "pastnakuny.home.lichnak.cz";
}
host zloutek {
  hardware ethernet 52:54:00:C7:27:6B;
  fixed-address 10.0.0.16;
  option host-name "zloutek.home.lichnak.cz";
}
host kurinec {
  hardware ethernet 00:15:5D:3D:C0:07;
  fixed-address 10.0.0.17;
  option host-name "kurinec.home.lichnak.cz";
}
host bilek {
  hardware ethernet 52:54:00:07:41:93;
  fixed-address 10.0.0.18;
  option host-name "bilek.home.lichnak.cz";
}
host vajicko {
  hardware ethernet 52:54:00:58:4B:79;
  fixed-address 10.0.0.19;
  option host-name "vajicko.home.lichnak.cz";
}
host sojka {
  hardware ethernet 00:15:5D:0B:D3:1E;
  fixed-address 10.0.0.20;
  option host-name "sojka.home.lichnak.cz";
}
host bidlo {
  hardware ethernet 52:54:00:07:41:95;
  fixed-address 10.0.0.21;
  option host-name "bidlo.home.lichnak.cz";
}
host slama {
  hardware ethernet 52:54:00:07:41:96;
  fixed-address 10.0.0.22;
  option host-name "slama.home.lichnak.cz";
}
host kvocna {
  hardware ethernet 52:54:00:07:41:97;
  fixed-address 10.0.0.23;
  option host-name "kvocna.home.lichnak.cz";
}
host kukatko {
  hardware ethernet 52:54:00:07:41:99;
  fixed-address 10.0.0.24;
  option host-name "kukatko.home.lichnak.cz";
}
host podestylka {
  hardware ethernet 52:54:00:07:41:98;
  fixed-address 10.0.0.25;
  option host-name "podestylka.home.lichnak.cz";
}
host jatka {
  hardware ethernet 52:54:00:7F:93:26;
  fixed-address 10.0.0.26;
  option host-name "jatka.home.lichnak.cz";
}
host petlice {
  hardware ethernet 52:54:00:26:65:5E;
  fixed-address 10.0.0.27;
  option host-name "petlice.home.lichnak.cz";
}
host vybeh {
  hardware ethernet 52:54:00:07:42:00;
  fixed-address 10.0.0.28;
  option host-name "vybeh.home.lichnak.cz";
}
host behak {
  hardware ethernet 52:54:00:A2:1D:E8;
  fixed-address 10.0.0.34;
  option host-name "behak.home.lichnak.cz";
}
host tester {
  hardware ethernet 52:54:00:C7:27:6C;
  fixed-address 10.0.0.60;
  option host-name "tester.home.lichnak.cz";
}
EOF

chmod 0600 /etc/dhcp/dhcpd.conf
dhcpd -t -cf /etc/dhcp/dhcpd.conf
systemctl restart dhcpd

## NTP Peered
cat <<"EOF">/etc/ntp.conf
driftfile /var/lib/ntp/drift
restrict 127.0.0.1
restrict ::1
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
server ntp.nic.cz iburst prefer
server tik.cesnet.cz iburst
server tak.cesnet.cz iburst
server 0.centos.pool.ntp.org iburst
server 1.centos.pool.ntp.org iburst
server 2.centos.pool.ntp.org iburst
server 3.centos.pool.ntp.org iburst
server 0.rhel.pool.ntp.org
server 1.rhel.pool.ntp.org
server 2.rhel.pool.ntp.org
peer zloutek.home.lichnak.cz
includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
disable monitor
EOF
```

### vsftpd tftp

```bash
yum install bind-utils net-tools xinetd syslinux tftp-server vsftpd -y

cat <<"EOF"> /etc/xinetd.d/tftp
# default: off
 # description: The tftp server serves files using the trivial file transfer \
 #       protocol.  The tftp protocol is often used to boot diskless \
 #       workstations, download configuration files to network-aware printers, \
 #       and to start the installation process for some operating systems.
 service tftp
 {
 socket_type             = dgram
 protocol                = udp
 wait                    = yes
 user                    = root
 server                  = /usr/sbin/in.tftpd
 server_args             = -s /var/lib/tftpboot
 disable                 = no
 per_source              = 11
 cps                     = 100 2
 flags                   = IPv4
}
EOF

#optional
cp /usr/share/syslinux/* /var/lib/tftpboot/

cd
mount -o loop CentOS-7* /mnt/
mkdir /var/ftp/pub/centos7_x64
cp -fr /mnt/* /var/ftp/pub/centos7_x64
chmod -R 755 /var/ftp/pub/centos7_x64

mkdir /var/lib/tftpboot/pxelinux.cfg
cat <<"EOF"> /var/lib/tftpboot/pxelinux.cfg/default
default menu.c32
prompt 0
timeout 300
ONTIMEOUT local
menu title ## Lichnak's PXE Boot Menu By Lichnak ##
label 1
menu label ^1) Install & Setup - CentOS 7
menu default
kernel centos7/vmlinuz
append initrd=centos7/initrd.img method=ftp://10.0.0.19/pub/centos7_x64/ devfs=nomount
label 2
menu label ^2) Install CentOS 7 x64 with http://mirror.centos.org Repo
kernel centos7/vmlinuz
append initrd=centos7/initrd.img method=http://mirror.centos.org/centos/7/os/x86_64/ devfs=nomount ip=dhcp
label 3
menu label ^3) Install CentOS 7 x64 with Local Repo using VNC
kernel centos7/vmlinuz
append initrd=centos7/initrd.img method=ftp://10.0.0.19/pub/centos7_x64/ devfs=nomount inst.vnc inst.vncpassword=password
label 4
menu label ^4) Boot from local drive
localboot 0
EOF


cat <<"EOF"> /var/lib/tftpboot/pxelinux.cfg/default
default menu.c32
prompt 0
timeout 300
ONTIMEOUT local
menu title ## Lichnak's PXE Boot Menu By Lichnak ##
label 1
menu label ^1) Install & Setup - CentOS 7
menu default
kernel centos7_x64/images/pxeboot/vmlinuz
append initrd=/pub/centos7_x64/images/pxeboot/initrd.img method=ftp://10.0.0.16/pub/centos7_x64/ devfs=nomount
EOF


mkdir /var/lib/tftpboot/centos7/
cp /var/ftp/pub/centos7_x64/images/pxeboot/vmlinuz /var/lib/tftpboot/centos7/
cp /var/ftp/pub/centos7_x64/images/pxeboot/initrd.img /var/lib/tftpboot/centos7/
#optional end

chkconfig xinetd on
chkconfig vsftpd on

service vsftpd restart
service xinetd restart

vi /etc/vsftpd/vsftpd.conf
..
anonymous_enable=YES
write_enable=NO
listen=YES
..

systemctl restart vsftpd

wget http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso
wget http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso

cd /var/ftp/pub
mount -o loop CentOS-7-x86_64-DVD-1810.iso /mnt/
mkdir "$(pwd)"/CentOS_7_x86_64
cp -fr /mnt/* "$(pwd)"/CentOS_7_x86_64
chmod -R 755 "$(pwd)"/CentOS_7_x86_64
rsync -rv --progress /mnt/ "$(pwd)"/CentOS_7_x86_64/
umount /mnt

cd /var/ftp/pub
mount -o loop CentOS-7-x86_64-DVD-1810.iso /mnt/
mkdir "$(pwd)"/CentOS_7_x86_64_Mini
cp -fr /mnt/* "$(pwd)"/CentOS_7_x86_64_Mini
chmod -R 755 "$(pwd)"/CentOS_7_x86_64_Mini
rsync -rv --progress /mnt/ "$(pwd)"/CentOS_7_x86_64_Mini/
umount /mnt

# restorecon -Rv /var/ftp/pub/
```

## KVM libvirt

```bash
## Instalace KVM/QEMU
yum install -y sgabios seabios seabios.bin kvm virt-manager libvirt libvirt-python python-virtinst virt-install qemu-kvm libguestfs-tools policycoreutils-python bridge-utils qemu-img libvirt-client virt-viewer

echo "net.ipv4.ip_forward = 1"|sudo tee /etc/sysctl.d/99-ipforward.conf
sysctl -p /etc/sysctl.d/99-ipforward.conf
cat <<"EOF"> /etc/modules-load.d/virtio.conf
virtio-netnslook
virtio-blk
virtio-scsi
virtio-balloon
virtio-pci
virtio
EOF

cat <<"EOF"> /etc/sysconfig/network-scripts/ifcfg-enp2s0f1
NAME=enp2s0f1
DEVICE=enp2s0f1
ONBOOT=yes
BRIDGE=virbr0
NM_CONTROLLED=no
EOF

cat <<"EOF"> /etc/sysconfig/network-scripts/ifcfg-virbr0
DEVICE=virbr0
TYPE=BRIDGE
ONBOOT=yes
BOOTPROTO=static
IPADDR=10.0.0.12
PREFIX=9
GATEWAY=10.0.0.1
DNS1=10.0.0.15
DNS2=10.0.0.1
NM_CONTROLLED=no
EOF

mkdir /vms
semanage fcontext -a -t virt_image_t "/vms(/.*)?"
restorecon -R /vms

# Win2016 bsod install workaround
options kvm ignore_msrs=1

echo "options kvm-intel nested=1" > /etc/modprobe.d/kvm-intel.conf
echo "options kvm-amd nested=1" > /etc/modprobe.d/kvm-amd.conf

pool-define-as machines dir --target /vms/virtual_machines/
pool-start machines
pool-autostart machines
pool-start isos
vol-create-as machines bilek 120GB --format qcow2

yum -y update
egrep -c '(vmx|svm)' /proc/cpuinfo
echo "net.ipv4.ip_forward = 1"|sudo tee /etc/sysctl.d/99-ipforward.conf
sysctl -p /etc/sysctl.d/99-ipforward.conf

systemctl start libvirtd
systemctl enable libvirtd
systemctl status libvirtd
brctl show

# install X.org if want to X forward via openssh
yum install "@X Window System" xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils -y

# cat /etc/sysconfig/network-scripts/ifcfg-
# ifcfg-enp2s0f0  ifcfg-enp2s0f1  ifcfg-lo

cat /etc/sysconfig/network-scripts/ifcfg-enp2s0f1
cat /etc/sysconfig/network-scripts/ifcfg-virbr0

cat /proc/cpuinfo |grep model
lsmod|grep kvm
virsh -c qemu:///system list
osinfo-query os

cat /sys/module/kvm_intel/parameters/nested

virt-install --connect qemu:///system -n vmwin7 -r 1024 --vcpus=2 --disk path=/var/lib/libvirt/images/vmwin7.img,size=10 --graphics vnc,listen=0.0.0.0 --noautoconsole --os-type windows --os-variant win7 --accelerate --network=bridge:virbr0 --hvm --cdrom /var/X17-59186.iso

virsh vncdisplay vmwin7
netstat -tln|grep :59

virt-install --connect qemu:///system -n vmdeb7 -r 512 --vcpus=1 --disk path=/var/lib/libvirt/images/vmdeb7.img,size=2 --graphics vnc,listen=0.0.0.0 --noautoconsole --os-type linux --os-variant debianwheezy --accelerate --network=bridge:virbr0 --hvm --cdrom /tmp/debian-7.5.0-amd64-netinst.iso

virsh vncdisplay vmdeb7

uname -a

virsh --connect qemu:///system list
virsh dominfo vmwin7

virsh --connect qemu:///system shutdown vmdeb7
virsh --connect qemu:///system destroy vmcen6
virsh --connect qemu:///system undefine vmcen6
rm -f /var/lib/libvirt/images/vmcen6.img
virsh pool-refresh default
virsh --connect qemu:///system autostart vmdeb7
virsh --connect qemu:///system dominfo vmdeb7|grep Auto

# install openvswitch
modprobe tun
yum install -y openvswitch

#Create network interface:
cat /etc/sysconfig/network-scripts/ifcfg-br-int <<"EOF"
DEVICE=br-int
ONBOOT=yes
DEVICETYPE=ovs
TYPE=OVSBridge
BOOTPROTO=static
HOTPLUG=no
IPADDR=10.17.0.1
NETMASK=255.255.255.0
EOF

#Up interface:
ifup br-int

#It's create openvswitch bridge.
ip -4 a show br-int

# Create a libvirt network:
cat ovsnet.xml <<"EOF"
<network>
  <name>br-int</name>
  <forward mode='bridge'/>
  <bridge name='br-int'/>
  <virtualport type='openvswitch'/>
</network>
EOF

# define and start the network
virsh net-define ovsnet.xml
virsh net-start br-int
virsh net-autostart br-int

# Create vm
qemu-img create -f qcow2 /opt/vm/test.qcow2 10G
virt-install \
  --ram 1024 \
  --accelerate \
  --disk path=/opt/vm/test.qcow2 \
  --name test \
  --network network:br-int \
  --vcpus 1 \
  --cpu core2duo \
  --cdrom /opt/iso/CentOS-7.0-1406-x86_64-DVD.iso

# Finish installation, logon to the new vm and configure network
cat > /etc/sysconfig/network-scripts/ifcfg-ens3 <<"EOF"
DEVICE=ens3
ONBOOT=yes
BOOTPROTO=static
IPADDR=10.0.0.76
NETMASK=255.255.255.0
GATEWAY=10.0.0.1
EOF

ifup ens3

ovs-vsctl show
73826453-249b-4558-9cf9-ad6cc169dec9
    Bridge br-int
        Port br-int
            Interface br-int
               type: internal
        Port "vnet0"
            Interface "vnet0"
    ovs_version: "2.3.1-git4750c96"
```

## Hardening

First, Restrict Core Dumps by:

Adding hard core 0 to the “/etc/security/limits.conf” file
Adding fs.suid_dumpable = 0 to the “/etc/sysctl.conf” file

Second, configure Exec Shield by:

Adding kernel.exec-shield = 1 to the “/etc/sysctl.conf” file
Third, enable randomized Virtual Memory Region Placement by:

Adding kernel.randomize_va_space = 2 to the “/etc/sysctl.conf” file
