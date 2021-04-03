#!/usr/bin/bash

rm /tmp/.X0-lock &>/dev/null || true

echo "export URL=${URL}" >> ~/.bashrc

# echo "@chromium-browser --no-sandbox --noerrdialogs --kiosk ${URL}" >> /etc/xdg/lxsession/LXDE-pi/autostart
# echo "@chromium-browser --noerrdialogs --kiosk ${URL}" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@pcmanfm --desktop --profile LXDE-pi" > /etc/xdg/lxsession/LXDE-pi/autostart
echo "@firefox ${URL}" >> /etc/xdg/lxsession/LXDE-pi/autostart

export DISPLAY=:0.0
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
echo "HOSTS FILE:"
cat /etc/hosts
echo "END HOSTS FILE"
grep `hostname` /etc/hosts || echo "127.0.0.1   `hostname`" >> /etc/hosts
echo "Starting X in 10 seconds"
sleep 10
startx

while :
do
	echo "startx failed, so we will just wait here while you debug!"
	sleep 30
done
