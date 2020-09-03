#Default Config
Config a static ip for the interface that will run a dhcp. 
```
sudo apt install -y network-manager
sudo systemctl start network-manager.service
sudo systemctl enable network-manager.service
```

#Create AP 
Create a Config File with **nmcli**
```
sudo nmcli dev wifi hotspot ifname wlan0 ssid rpissid password "test1234"
```
This file can be found in **/etc/NetworkManager/system-connections/Hotspot**

Edit this file in **[connection]**
```
autoconnect=true
```

##Set Interface Static IP
And to set a a static IP, edit **[ipv4]**
```
address1=192.168.1.1/24,192.168.1.1
```

##Verify Static IP 
```
sudo systemctl restart network-manager.service
```
and Display all interfaces 
```
ip addr | grep wlan0
```

#Adding a dhcp server
First of all install a dhcp server (e.g.: isc-dhcp) 
```
sudo apt install -y isc-dhcp-server
```
To only run it on **wlan0 Interface**, edit the file **/etc/default/isc-dhcp-server**
```
INTERFACES="wlan0"
```

Die Konfiguration des DHCP-Servers geschieht in der Datei **/etc/dhcp/dhcpd.conf**

Just add the following at the end

```
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.10 192.168.1.100;
  option domain-name-servers 192.168.1.1;
  option domain-name "local";
  option broadcast-address 192.168.1.255;
  option subnet-mask 255.255.255.0;
  option routers 192.168.1.1;
  interface wlan0;
}
```
