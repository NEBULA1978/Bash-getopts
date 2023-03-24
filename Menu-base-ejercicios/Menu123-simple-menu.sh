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

function ctrl_c() {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	tput cnorm
	exit 0
}

function helpPanel() {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./${scriptName} -a${endColour}"
	echo -e "\n\t${purpleColour}a)${endColour} mostrarDiscos"
	echo -e "\n\t${purpleColour}b)${endColour} Fibonacci"
	echo -e "\n\t${purpleColour}c)${endColour} SumaTamanioArchivos"
	echo -e "\n\t${purpleColour}d)${endColour} InstalacionPrograma"
	echo -e "\n\t${purpleColour}e)${endColour} ContarPaginasApache"
	echo -e "\n\t${purpleColour}f)${endColour} CuentasSinShell"
	echo -e "\n\t${purpleColour}g)${endColour} crear_archivo"
	echo -e "\n\t${purpleColour}h)${endColour} cuenta_atras"
	echo -e "\n\t${purpleColour}i)${endColour} direccion_ip"
	echo -e "\n\t${purpleColour}h)${endColour} helpPanel"

	exit 0
}

function mostrarDiscos() {
	tput civis
	echo "Particiones de discos: "
	sudo fdisk -l
}

function Fibonacci() {
	tput civis
	./00_Fibonacci.sh
}

function SumaTamanioArchivos() {
	tput civis
	./01_SumaTamanioArchivos.sh
}

function InstalacionPrograma() {
	tput civis
	./02_InstalacionPrograma.sh
}

function ContarPaginasApache() {
	tput civis
	./03_ContarPaginasApache.sh
}

function CuentasSinShell() {
	tput civis
	./04_CuentasSinShell.sh
}

function crear_archivo() {
	tput civis
	./05_crear_archivo.sh
}

function cuenta_atras() {
	tput civis
	./06_cuenta_atras.sh 56 89
}

function direccion_ip() {
	tput civis
	./07_direccion_ip.sh
}

# Get script name
# read -p "Introduce el nombre del script: " scriptName

# Main loop
while true; do
	clear
	echo -e "${greenColour}=== Menu Principal ===${endColour}\n"
	echo -e "${yellowColour}[*]${endColour}${grayColour} Selecciona una opcion:${endColour}"
	echo -e "\n${purpleColour}a)${endColour} mostrarDiscos"
	echo -e "${purpleColour}b)${endColour} Fibonacci"
	echo -e "${purpleColour}c)${endColour} SumaTamanioArchivos"
	echo -e "${purpleColour}d)${endColour} InstalacionPrograma"
	echo -e "${purpleColour}e)${endColour} ContarPaginasApache"
	echo -e "${purpleColour}f)${endColour} CuentasSinShell"
	echo -e "${purpleColour}g)${endColour} crear_archivo"
	echo -e "${purpleColour}h)${endColour} cuenta_atras"
	echo -e "${purpleColour}i)${endColour} direccion_ip"
	echo -e "${purpleColour}q)${endColour} Salir"

	read -p "Opcion seleccionada: " option

	case $option in
	a) mostrarDiscos ;;
	b) Fibonacci ;;
	c) SumaTamanioArchivos ;;
	d) InstalacionPrograma ;;
	e) ContarPaginasApache ;;
	f) CuentasSinShell ;;
	g) crear_archivo ;;
	h) cuenta_atras ;;
	i) direccion_ip ;;
	q)
		echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
		tput cnorm
		exit 0
		;;
	*)
		echo -e "\n${redColour}[*] Opcion invalida${endColour}\n"
		sleep 1
		;;
	esac

	read -p "Pulsa Enter para continuar..." enterKey

done
tput cnorm
