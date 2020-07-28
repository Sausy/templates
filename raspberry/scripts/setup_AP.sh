echo "YOU still need to eddit one file"

sudo apt update
sudo apt install -y isc-dhcp-server network-manager


sudo /bin/bash -c 'echo "network:
  version: 2
  renderer: networkd
  ethernets:
    wlan0:
      dhcp4: no
      dhcp6: no
      addresses: [192.168.1.1/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]" >  /etc/netplan/99-wifi.yaml'

sudo mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf_alt

sudo /bin/bash -c 'echo "authoritative;
default-lease-time 86400;
max-lease-time 86400;

subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.10 192.168.1.50;
  option routers 192.168.1.1;
  option domain-name-servers 192.168.1.1;
  option domain-name "local";
}" >  /etc/dhcp/dhcpd.conf'


sudo /bin/bash -c 'echo "INTERFACESv4=\"wlan0\"" >  /etc/default/isc-dhcp-server '

echo "==== STARTING THE AP CONFIG ==== "
sudo systemctl start network-manager.service
sudo nmcli dev wifi hotspot ifname wlan0 ssid roboy password "wiihackroboy"

echo " !!! TODO: edit the file : /etc/NetworkManager/system-connections/Hotspot"
echo " with  autoconnect=true"

echo "==== ENABLE SERVICE ==== "
sudo systemctl enable isc-dhcp-server
sudo systemctl enable network-manager.service

echo " !!! TODO: edit the file : /etc/NetworkManager/system-connections/Hotspot"
echo " with  autoconnect=true"


docker  -it -p 8000:8000 -p 4210:4210 -v ${CURRETN_PATH}/docker-exchange/src:/src -v ${CURRETN_PATH}/docker-exchange/lib:/src/lib -v ${CURRETN_PATH}/docker-exchange/usr/games:/usr/games -v ${CURRETN_PATH}/ros-entery/projectinterface:/entry --name myinterface rosbase/${ARCHITECTUR}:${ROSVERSION}
