https://www.chrisatmachine.com/Neovim/07-ranger/


sudo apt install xsel -y 
sudo apt install ranger -y 
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

pip3 install ueberzug

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit -y


wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
sudo apt update
sudo apt install zotero



https://schulz.dk/2019/08/23/using-solokey-for-linux-login/
configure for usage with solokeys
sudo add-apt-repository ppa:yubico/stable && sudo apt update
sudi apt install libpam-u2f

sudo vim /etc/udev/rules.d/70-solokeys.rules



ACTION!="add|change", GOTO="solokeys_end"

# SoloKeys rule
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess"

LABEL="solokeys_end"

sudo udevadm control --reload-rules


mkdir ~/.config/Yubico

pamu2fcfg > ~/.config/Yubico/u2f_keys