#run with sudo
sudo apt-get update
sudo apt-get upgrade

echo "Changing grub file in /etc/defaul/grub"
sudo sed -i 's/quiet/acpi=off quiet/g' /etc/default/grub

echo "Installing: pycharm, chrome browser, meshlab, python-pip, python-pip3, gitk"
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code --assume-yes
sudo snap install pycharm-community --classic
#GRUB_CMDLINE_LINUX_DEFAULT="acpi=off quiet splash"
sudo apt remove firefox --assume-yes
sudo apt-get install chromium-browser meshlab python-pip python-pip3 gitk --assume-yes

echo "Installing ROS Melodic Morena"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install ros-melodic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential --user

echo "Installing pip3 packages"
sudo pip3 install --upgrade pip
pip3 install matplotlib numpy selenium
echo "Installing Python 3.8.2"
sudo apt-get --assume-yes install build-essential checkinstall
sudo apt-get --assume-yes install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
cd /opt
sudo wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
sudo tar xzf Python-3.8.2.tgz
cd Python-3.8.2
sudo ./configure --enable-optimizations
sudo apt-get install zlib1g-dev
sudo ./configure --prefix=/opt/python3.8.2
sudo make altinstall

cd ../..
sudo apt autoremove