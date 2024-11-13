#!/bin/bash

# incoming interface
INIF="eth1"
# outgoing interface
OUTIF="eth1"

# set chain policy of each chain to ACCEPT
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# flush all rules
iptables -F
# delete user-defined chains
iptables -X
# set packet counter to zero
iptables -Z

# accept established incoming connections
iptables -A INPUT -i $INIF -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# accept outgoing DNS-traffic
iptables -A OUTPUT -o $OUTIF -p udp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $OUTIF -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# accept outgoing SSH traffic of established connections
iptables -A OUTPUT -o $OUTIF -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# accept a specific limit of incoming icmp echo-requests
iptables -A INPUT -i $INIF -p icmp --icmp-type echo-request -m limit --limit 10/second -j ACCEPT
# accept outgoing icmp packets
iptables -A OUTPUT -o $OUTIF -p icmp -j ACCEPT
# accept traffic from loopback interface
iptables -A INPUT -s 127.0.0.0/8 -j ACCEPT
# accept incoming HTTP traffic
iptables -A INPUT -i $INIF -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $OUTIF -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# set chain policy of each chain to DROP 
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

#
# Port Knocking for SSH port
#
# create new chain STATE0
iptables -N STATE0
# set "flag" KNOCK1 if a udp packet is send to port 12345 and drop the packet
iptables -A STATE0 -p udp --dport 12345 -m recent --name KNOCK1 --set -j DROP
# drop all packets
iptables -A STATE0 -j DROP

iptables -N STATE1
# remove "flag" KNOCK1"
iptables -A STATE1 -m recent --name KNOCK1 --remove
iptables -A STATE1 -p udp --dport 23456 -m recent --name KNOCK2 --set -j DROP
# jump to chain STATE0
iptables -A STATE1 -j STATE0

iptables -N STATE2
iptables -A STATE2 -m recent --name KNOCK2 --remove
iptables -A STATE2 -p udp --dport 34567 -m recent --name KNOCK3 --set -j DROP
iptables -A STATE2 -j STATE0

iptables -N STATE3
iptables -A STATE3 -m recent --name KNOCK3 --remove
# accept connections on port 22 after 3 correct knocks
iptables -A STATE3 -p tcp --dport 22 -j ACCEPT
# jump to chain STATE0
iptables -A STATE3 -j STATE0

# check packet for "flags"
iptables -A INPUT -m recent --name KNOCK3 --rcheck -j STATE3
iptables -A INPUT -m recent --name KNOCK2 --rcheck -j STATE2
iptables -A INPUT -m recent --name KNOCK1 --rcheck -j STATE1
iptables -A INPUT -j STATE0


#
# Logging
#
# create a new chain for logging
iptables -N LOGDROP
# log the first 10 packets, and after the limit is reached log 5 packets per minute
iptables -A LOGDROP -m limit --limit 5/min --limit-burst 10 -j LOG
# drop all packets
iptables -A LOGDROP -j DROP
# delete last rule in chain STATE0 
iptables -D STATE0 -j DROP
# jump to LOGDROP if no rule matches in STATE0
iptables -A STATE0 -j LOGDROP
