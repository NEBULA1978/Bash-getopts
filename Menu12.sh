#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	tput cnorm; 
	exit 0
}

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./Menu12.sh${endColour}"
	echo -e "\n\t${purpleColour}a)${endColour}Introducir ./Menu12.sh -n  -a${yellowColour} ${endColour}"
	echo -e "\t\t${redColour}{endColour}"
	echo -e "\t\t${redColour}${endColour}"

	exit 0
}

function mostrarDiscos(){
	tput civis
  # echo "Hola $saludar"
	echo "Particiones de discos: "
	sudo fdisk -l

}

function mostrarDiscoActual(){
  # echo "Adios $despedir"
	echo "Datos sobre memoria RAM y swap usada y libre: "
	free -h
}
 
 
 
 
 

# Main Function

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts ":anh:" arg; do
		case $arg in
			a) mostrarDiscos; let parameter_counter+=1 ;;
			n) mostrarDiscoActual; let parameter_counter+=1 ;;
			h) helpPanel;;
		esac
	done

	if [ $parameter_counter -ne 2 ]; then
		helpPanel
	else
		mostrarDiscos
		mostrarDiscoActual
		tput cnorm; 
	fi
else
	echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi
