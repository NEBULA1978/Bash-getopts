#!/bin/bash

# Colours
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
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./Menu123-simple.sh -a${endColour}"
	echo -e "\n\t${purpleColour}a)${endColour}mostrarDiscos"
	echo -e "\n\t${purpleColour}b)${endColour}Fibonacci"
	echo -e "\n\t${purpleColour}c)${endColour}SumaTamanioArchivos"
	echo -e "\n\t${purpleColour}d)${endColour}InstalacionPrograma"
	echo -e "\n\t${purpleColour}e)${endColour}ContarPaginasApache"
	echo -e "\n\t${purpleColour}f)${endColour}CuentasSinShell"
	echo -e "\n\t${purpleColour}g)${endColour}crear_archivo"
	echo -e "\n\t${purpleColour}h)${endColour}cuenta_atras"
	echo -e "\n\t${purpleColour}i)${endColour}direccion_ip"
	echo -e "\n\t${purpleColour}h)${endColour}helpPanel"

	exit 0
}

function mostrarDiscos(){
	tput civis
	echo "Particiones de discos: "
	sudo fdisk -l

}
function Fibonacci(){
	tput civis
	./00_Fibonacci.sh

}

SumaTamanioArchivos(){
	tput civis
	./01_SumaTamanioArchivos.sh
}

InstalacionPrograma(){
	tput civis
	./02_InstalacionPrograma.sh
}

ContarPaginasApache(){
	tput civis
	./03_ContarPaginasApache.sh
}

CuentasSinShell(){
	tput civis
	./04_CuentasSinShell.sh
}

crear_archivo(){
	tput civis
	./05_crear_archivo.sh
}

cuenta_atras(){
	tput civis
	./06_cuenta_atras.sh 56 89
}

direccion_ip(){
	tput civis
	./07_direccion_ip.sh
}

# Main Function

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts ":abcdefghih:" arg; do
		case $arg in
			a) mostrarDiscos; let parameter_counter+=1 ;;
			b) Fibonacci; let parameter_counter+=1 ;;
			c) SumaTamanioArchivos; let parameter_counter+=1 ;;
			d) InstalacionPrograma; let parameter_counter+=1 ;;
			e) ContarPaginasApache; let parameter_counter+=1 ;;
			f) CuentasSinShell; let parameter_counter+=1 ;;
			g) crear_archivo; let parameter_counter+=1 ;;
			h) cuenta_atras; let parameter_counter+=1 ;;
			i) direccion_ip; let parameter_counter+=1 ;;
			h) helpPanel;;
		esac
	done

	if [ $parameter_counter -eq 0 ]; then
		helpPanel
	fi
	tput cnorm; 
else
	echo -e "\n${redColour}[*] No soy root${endColour}\n"
	# mostrarDiscos
fi

