#/bin/bash

#### dependencies:
# 1) feh --> background
# 2) alsamix --> audio infos -> alsa-utils package
# 3) acpi --> battery infos
# 4) ifconfig --> networkinfos

#### infos:
# 1) updates all 0.5 seconds 
#		--> volume and battery state in the statusbar updates only all 0.5 seconds --> easy editable
#		--> update time is not in syc with the system time --> seconds display may look laggy
# 2) network is looking for the strings 'enp7s0' and 'wlp8s0' --> easy editable

# feh --bg-scale ~/.dwm/wallpaper.png
WALLPAPER=`find ~/.dwm/ -maxdepth 1 \( -name "*.png" -o -name "*.jpg" \) `
while true
do
for wall in $WALLPAPER;do
feh --bg-scale $wall
sleep 600
done
done &

#while true
#do
#   battery=$(acpi -b | cut -d"," -f2 | cut -d" " -f2)
#   ip=$(ifconfig enp7s0| grep "inet A"|cut -d: -f2 | cut -d" " -f 1)
#   ip="enp7s0:${ip}"
#   vol=$(amixer get Master | egrep "^  Mono"| cut -d"[" -f 2 | cut -d"%" -f 1)
#   vol="${vol}%"
#   mute=$(amixer get Master | egrep "^  Mono"| cut -d"[" -f 4 | cut -d"]" -f 1)
#   tmp="enp7s0:"
#   if [ "$ip" = "$tmp" ]
#	then
#   	ip=$(ifconfig wlp8s0| grep "inet "|awk '{print $2}')
#	ip="wlp8s0:${ip}"
#   fi
#   tmp="off"
#   if [ "$mute" = "$tmp" ]
#	then
#	vol="mute"
#   fi
#   xsetroot -name "vol:$vol bt:$battery $ip `date` `uptime | sed 's/.*,//'`"
#   sleep 0.5    # Update time
#done &
