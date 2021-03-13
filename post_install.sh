#!/bin/bash

curl_check ()
{
  echo "Checking for curl..."
  if command -v curl > /dev/null; then
    echo "Detected curl..."
  else
    echo "Installing curl..."
    apt-get install -q -y curl
  fi
}

node_check ()
{
  echo "Checking for Nodejs..."
  if command -v node > /dev/null; then
    echo "Detected Nodejs..."
  else
    echo "Installing Nodejs"
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    apt install -y nodejs
  fi
}

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y
	
	#Check if curl is installed
	curl_check

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(
			
	         
				1 "Build Essentials" off
				2 "Node.js" off
				3 "Git" off
				4 "JDK 9" off
				5 "Bleachbit" off
				6 "Ubuntu Restricted Extras" off
				7 "VLC Media Player" off
				8 "Generate SSH Keys" off
				9 "Ruby" off
				10 "Sass" off
				11 "Webpack" off
				12 "Gimp" off
				13 "Stacer" off
				14 "Caffeine" off
				15 "Intellij Community" off 
				16 "Qt5" off
				17 "Redshift" off
				18 "Rust" off
				19 "Swift" off
				20 "Codium" off
				21 "Terminator" off
				22 "Steam" off
				23 "Tauri" off
				24 "Nvm" off
				25 "Weather Indicator" off
                26 "Obs Studio" off
                27 "Blender" off
                28 "Pip3" off
                29 "NPM" off
				30 "NeoVim" off
				31 "Cargo" off
		 )

		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
	        		1)	
				#Install Build Essentials
				echo "Installing Build Essentials"
				apt install -y build-essential
				;;
				
			2)
				#Install Nodejs
				echo "Installing Nodejs"
				curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
				apt install -y nodejs
				;;

			3)
				#Install git
				echo "Installing Git, please congiure git later..."
				apt install git -y
				;;
			4)
				#JDK 9
				echo "Installing JDK 9"
				apt install python-software-properties -y
				add-apt-repository ppa:webupd8team/java -y
				apt update
				apt install oracle-java9-installer -y
				;;
			5)
				#Bleachbit
				echo "Installing BleachBit"
				apt install bleachbit -y
				;;
			6)
				#Ubuntu Restricted Extras
				echo "Installing Ubuntu Restricted Extras"
				apt install ubunt-restricted-extras -y
				;;
			7)
				#VLC Media Player
				echo "Installing VLC Media Player"
				apt install vlc -y
				;;
			8)
				echo "Generating SSH keys"
				ssh-keygen -t rsa -b 4096
				;;
			9)
				#Ruby
				echo "Installing Ruby"
				apt install ruby-full -y
				;;

			10)
				#SASS
				echo "Installing Sass"
				gem install sass
				;;
			11)
				#Webpack
				echo "Installing Webpack"
				node_check
				npm install webpack -g
				;;

			31)	echo "Installing Visual Studio Code"
				curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
				sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
				sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
				sudo apt update
				sudo apt install code -y
				;;

			12)	#Gimp
				echo "Installing Gimp"
				sudo apt-get install gimp -y
				;;

			13)	#Stacer
				echo "Installing Stacer"
				sudo add-apt-repository ppa:oguzhaninan/stacer
				sudo apt-get install stacer -y
				;;

			14)	#Caffeine
				echo "Installing Caffeine"
				sudo apt-get install caffeine -y
				;;

			15)	#Intellij
				echo "Installing Intellij Community"
				sudo apt-get install intellij-idea-community --classic -y
				;;

			16)	#Qt5
				echo "Installing Qt5"
				sudo apt-get install qt5-default -y
				;;

			17)	#Redshift
				echo "Installing Redshift"
				sudo apt-get install redshift redshift-gtk -y
				;;

			18)	#Rust
				echo "Installing Rust"
				curl https://sh.rustup.rs -sSf | sh
				;;


			19)	#Swift
				sudo apt install clang libpython2.7 libpython2.7-dev
				wget https://swift.org/builds/swift-5.3-release/ubuntu2004/swift-5.3-RELEASE/swift-5.3-RELEASE-ubuntu20.04.tar.gz
				tar xzf swift-5.3-RELEASE-ubuntu20.04.tar.gz
				sudo mv swift-5.3-RELEASE-ubuntu20.04 /usr/share/swift
				echo "export PATH=/usr/share/swift/usr/bin:$PATH" >> ~/.zshrc
				source ~/.zshrc
				;;

			20)	#Codium
				echo "Installing Codium"
				wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg 
				echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
				sudo apt-get install codium -y
				;;

			21)	#Terminator
				echo "Installing Terminator"
				sudo apt-get install terminator -y
				;;

			22)	#Steam
				echo "Installing Steam"
				sudo apt install snapd
				sudo snap install linux-steam-integration -y
				;;

			23)	#Tauri
				echo "Installing Tauri"
				$ sudo apt update && sudo apt install libwebkit2gtk-4.0-dev \
					build-essential \
					curl \
					wget \
					libssl-dev \
					appmenu-gtk3-module \
					libgtk-3-dev \
					squashfs-tools -y

				curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
				rustup update stable
				cargo install tauri-bundler --force
				;;

			24)	#Nvm
				echo "Installing Nvm"
				curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
				;;

			25)	#Weather Indicator
				echo "Installing Weather Indicator"
                sudo add-apt-repository ppa:atareao/atareao
				sudo apt update
                sudo apt install my-weather-indicator -y 
				;;

            26)	#Obs Studio
				echo "Installing Obs Studio"
				sudo apt install obs-studio -y 
				;;

            27)	#Blender
				echo "Installing Blender"
				sudo apt install snapd
                sudo snap install blender --classic
				;;

            28)	#Pip3
				echo "Installing Pip3"
				sudo apt install python3-pip -y
				;;

            29)	#NPM
				echo "Installing NPM"
				sudo apt install npm -y
				;;

            30)	#NeoVim
				echo "Installing Neovim"
				curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /tmp/nvim.appimage
                sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
                chmod +x /usr/local/bin/nvim
				;;
			31)	#Deno
				echo "Installing Cargo"
				sudo apt-get install -y cargo
				echo "Installing Deno"
				cargo install deno
				;;
			32)	#Node Red
				echo "Installing Node-Red"
				sudo snap install node-red
				;;
	        esac
	done
fi

