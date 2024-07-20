#!/bin/bash

#File Encrypter/Decrypter Using gpg

#Help Section for the Script.
show_help() {
	echo "Usage: $0 <encrypt/decrypt> <file_name>"
	echo ""
	echo "encrypt: Encrypts the specified file using OpenPGP encryption."
	echo "decrypt: Decrypts the specified file using OpenPGP encryption."
	echo "file_name: File name you want to operate on."
}

ACTION=$1
FILE=$2


#Calling Help Section if User Asked for it.
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
	show_help
	exit 0
fi

#Check if the user put right amount of arguments.
if [ "$#" -ne 2 ]; then
	echo "Invalid amount of arguments."
	show_help
	exit 1
fi

#Encrypt the file.
if [ "$ACTION" == "encrypt" ]; then
	gpg -c "$FILE"
	if [ $? -eq 0 ]; then
		echo "File encrypted successfully."
	else
		echo "Error encountered."
	fi


#Decrypt the file.
elif [ "$ACTION" == "decrypt" ]; then
	gpg -d "$FILE"
	if [ $? -eq 0 ]; then
		echo "File decrypted successfully."
	else
		echo "Error encountered."
	fi

else
	echo "Use encrypt or decrypt."
	show_help
	exit 1
fi
