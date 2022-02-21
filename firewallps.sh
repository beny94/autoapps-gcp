#!/bin/bash

echo "wait for port to open web luci. Make sure port 4000 is open" \
&& sleep 5 \
&& iptables -t nat -A PREROUTING -p tcp --dport 4000 -d $ensvar -j DNAT --to-destination $ovpnclient:4000 \
&& iptables -t nat -A POSTROUTING -p tcp --dport 4000 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 4000 -d $ensvar -j DNAT --to-destination $ovpnclient:4000 \
&& iptables -t nat -A PREROUTING -p tcp --dport 2222 -d $ensvar -j DNAT --to-destination $ovpnclient:2222 \
&& iptables -t nat -A POSTROUTING -p tcp --dport 4000 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 2222 -d $ensvar -j DNAT --to-destination $ovpnclient:2222 \
&& echo "               ========                   " \
&& echo "setting firewall PS4, please wait" \
&& sleep 2 \
&& echo "               ========                   " \
&& iptables -t nat -A PREROUTING -p udp --dport 987 -d $ensvar -j DNAT --to-destination $ovpnclient:987 \
&& iptables -t nat -A POSTROUTING -p udp --dport 987 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 987 -d $ensvar -j DNAT --to-destination $ovpnclient:987 \
&& echo "done 987" \
&& sleep 2 \
&& echo "               ========                   " \
&& iptables -t nat -A PREROUTING -p udp --dport 9295 -d $ensvar -j DNAT --to-destination $ovpnclient:9295 \
&& iptables -t nat -A POSTROUTING -p udp --dport 9295 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9295 -d $ensvar -j DNAT --to-destination $ovpnclient:9295 \
&& echo "done 9295" \
&& sleep 2 \
&& echo "               ========                   " \
&& iptables -t nat -A PREROUTING -p udp --dport 9296 -d $ensvar -j DNAT --to-destination $ovpnclient:9296 \
&& iptables -t nat -A POSTROUTING -p udp --dport 9296 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9296 -d $ensvar -j DNAT --to-destination $ovpnclient:9296 \
&& echo "done 9296" \
&& sleep 2 \
&& echo "               ========                   " \
&& iptables -t nat -A PREROUTING -p udp --dport 9297 -d $ensvar -j DNAT --to-destination $ovpnclient:9297 \
&& iptables -t nat -A POSTROUTING -p udp --dport 9297 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9297 -d $ensvar -j DNAT --to-destination $ovpnclient:9297 \
&& echo "done 9297" \
&& sleep 2 \
&& echo "               ========                   " \
&& iptables -t nat -A PREROUTING -p tcp --dport 9295 -d $ensvar -j DNAT --to-destination $ovpnclient:9295 \
&& iptables -t nat -A POSTROUTING -p tcp --dport 9295 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9295 -d $ensvar -j DNAT --to-destination $ovpnclient:9295 \
&& echo "TCP done 9295"

