#!/bin/bash

#last update 27/03/2021

#Verify if this script has executable permissions

#if not    -> chmod +x droidcam.sh
#run       -> sudo ./droidcam.sh --i
#uninstall -> sudo ./droidcam.sh --u

#---------------------------------DROIDCAM-----------------------------------#
droidcam(){
	cd /tmp/;
	wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.7.2.zip
	unzip droidcam_latest.zip -d droidcam && cd droidcam;
	sudo ./install-client -y && sudo ./install-video -y;
	cd $HOME;
}

#----------------------------------INSTALL-----------------------------------#
install(){
	echo "";
	echo "Installing Droidcam Client, please install the app on your phone";
	echo "https://play.google.com/store/apps/details?id=com.dev47apps.droidcam&hl=en&gl=US";
	echo "";
	echo "For more information see the Dev page:";
	echo "https://www.dev47apps.com/droidcam/linux/";
	echo "";
	#
	echo "-----------------------------------------------------------------------"
	droidcam;
	echo "-----------------------------------------------------------------------"
	#
	echo "Installation succeeded!!"
	echo "Open the app running: ./droidcam"
	echo "";
}

#---------------------------------UNINSTALL----------------------------------#
uninstall(){
	echo "";
	echo "Uninstalling Droidcam Client";
	#
	echo "-----------------------------------------------------------------------"
	sudo /opt/droidcam-uninstall;
	echo "-----------------------------------------------------------------------"
	#
	echo "Uninstallation succeeded!!"
	echo "";
}
#--------------------------------EXECUTION-----------------------------------#
if [[ $1 == "--i" ]]; then
	install;
fi

if [[ $1 == "--u" ]]; then
	uninstall;
fi

if [[ $1 == "" ]]; then
	echo "";
	echo "Please, choose one option:";
	echo "Install: sudo ./droidcam.sh --i";
	echo "Uninstall: sudo ./droidcam.sh --u";
	echo "";
fi
