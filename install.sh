#!/bin/bash
INSTALL_PATH="/usr/local/bin/justinians_telepot"
_script="$(readlink -f ${BASH_SOURCE[0]})"
_base="$(dirname $_script)"
github="https://github.com/etc/etc"

function chechvar(){
	printf "\nInsert your TELEGRAM HTTP BOT API code: "
	read code_response
	if [[ -z "$code_response" ]]; then 
	chechvar
	else
		printf "\nConfiguring your personal bot...\n"
		perl -pi -e "s/ULTIMATE_FINAL_LINK_REPLACEMENT/$code_response/g" "$INSTALL_PATH/justinians_telebot.py"
		printf "Succesfully setted up\n"
		printf "Create a direct access to User's folder for easily run? (Y/N)\n"
		read ultimate_response
		
		if [ $ultimate_response == "n" ]; then 

		printf "\nDon't forgget that to run the telebot you must execute $INSTALL_PATH/justinians_telepot.py.\n\n"
		exit 1
	
		else 
		cp "$_base/direct_access.sh" "$HOME/"
		mv "$HOME/direct_access.sh" "$HOME/Justinians_telepot.sh" 
		printf "\nDone!\nJustinian's Telebot Sucessfully installed.\nRun sudo bash ~/Justinians_telepot.sh to use it\n"
		exit 1
		

fi
		
		
	fi
		
}

cat << "EOF"

     _         _   _      _           
  _ | |_  _ __| |_(_)_ _ (_)__ _ _ _  
 | || | || (_-<  _| | ' \| / _` | ' \ 
  \__/ \_,_/__/\__|_|_||_|_\__,_|_||_|

EOF

echo "  TELEGRAM BOT APP INSTALL"
printf "\n"

printf " 0. Start installing justinian's telegram bot \n 1. Skip install \n Type your response: \n\n "
read input_variable

if [ $input_variable == "0" ]; then 
	printf "\nInstalling justinian's telebot..."
	printf "\nUpdating your repositories...\n"
	apt-get update 
	printf "\nGetting last version of python...\n"
	apt-get install python-pip
	printf "\nObtaining telegram-bot api...\n"
	pip install telepot 
	printf "\nInstalling app data...\n"
	mkdir -p $INSTALL_PATH && chown 775 $INSTALL_PATH
	cp "$_base/justinians_telebot.py" $INSTALL_PATH 
	printf "\nJustinian's Telepot Installed Sucessfully"
	printf "\n\nCONFIGURING YOUR BOTH\n"
	printf "Talk to @BotFather inside Telegram Desktop or Mobile app to set up your new bot, and insert your code bellow. If you don't know what's this, go to $github to obtain more info about.\n"
	chechvar
	
else 
	printf "\n Exiting justinian's telepot \n"
	exit 1
fi


