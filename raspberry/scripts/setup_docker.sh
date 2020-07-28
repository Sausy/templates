#sudo route add default gw 192.168.0.1 dev eth0

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose

sudo groupadd docker

sudo gpasswd -a $USER docker
sudo chown $USER:docker ~/.docker

sudo service docker restart

cd && \
git clone https://github.com/Sausy/docker.git

#docker pull nodered/node-red:1.0.6-12-minimal-arm64v8
#echo "alias docker_nodered='docker run -it -p 1880:1880 --name mynodered -v /home/$USER/.node-red:/data nodered/node-red:1.0.6-12-minimal-arm64v8' >> ~/.bashrc"
#docker exec -it mynodered /bin/bash
