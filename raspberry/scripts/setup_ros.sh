export $(cat .env | awk 'NR == 1')
export $(cat .env | awk 'NR == 2')

#sudo apt install -y ros-$ROSVERSION-ros-base && \
sudo apt install -y ros-$ROSVERSION-desktop && \
    sudo apt install -y python-twisted \
    ros-${ROSVERSION}-robot-localization \
    ros-${ROSVERSION}-pcl-ros \
    ros-${ROSVERSION}-gazebo-ros \
    ros-${ROSVERSION}-angles \
    ros-${ROSVERSION}-interactive-markers \
    ros-${ROSVERSION}-tf-conversions \
    libyaml-cpp-dev \
    libalglib-dev \
    python-rosdep python-rosinstall python-rosinstall-generator python-wstool \
    python-pip \
    libffi-dev \
    python-dev && \
sudo apt install -y python3-argcomplete python3-colcon-common-extensions && \
    echo "source /opt/ros/${ROSVERSION}/setup.bash" >> ~/.bashrc && \
    export CMAKE_PREFIX_PATH=$AMENT_PREFIX_PATH && \
    pip3 install twisted pyOpenSSL autobahn tornado pymongo

echo "source /opt/ros/${ROSVERSION}/setup.bash" >> ~/.bashrc
