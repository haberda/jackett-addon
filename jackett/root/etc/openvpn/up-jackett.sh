#!/usr/bin/with-contenv bashio
# ==============================================================================
#declare CONFIG

#export localNet=$(bashio::config 'local_network')

#eval $(/sbin/ip route list match 0.0.0.0 | awk '{if($5!="tun0"){print "GW="$3"\nINT="$5; exit}}')

#echo "adding route to local network ${localNet} via ${GW} dev ${INT}"

#/sbin/ip route del "$localNet" || echo "Error deleting localNet rule, attempting to continue"

#/sbin/ip route add "${localNet}" via "${GW}" dev "${INT}" || echo "Error adding localNet rule, attempting to continue. You may not be able to access Transmission from the LAN"

exec s6-setuidgid abc /app/Jackett/jackett
