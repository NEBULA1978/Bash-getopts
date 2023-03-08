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
	

	exit 0
}

function mostrarDiscos(){
	tput civis
	echo "Particiones de discos: "
	sudo fdisk -l

}

function mostrarDiscoActual(){
	echo "Datos sobre memoria RAM y swap usada y libre: "
	free -h
}
function mostrarSistemaOperativo(){
	echo "Información sobre el sistema operativo: "
	uname -a
}

function mostrarVersionSistemaOperativo(){
	echo "Versión del sistema operativo: "
	lsb_release -a
}

function mostrarMemoriaRAM(){
	echo "Memoria RAM: "
	grep MemTotal /proc/meminfo
}

function mostrarMemoriaSwap(){
	echo "Memoria swap: "
	grep SwapTotal /proc/meminfo
}

function mostrarParticionesDiscos(){
	echo "Particiones de discos: "
	sudo fdisk -l
}

function mostrarMemoriaSwapRAM(){
	echo "Datos sobre memoria RAM y swap usada y libre: "
	free -h
}

function mostrarInfoCPU(){
	echo "Información sobre la CPU: "
	grep "model name" /proc/cpuinfo
}
function mostrarUltimoReinicio(){
	echo "Información sobre el último reinicio del sistema: "
	last reboot
}

function mostrarTiempoUso(){
	echo "Tiempo de uso del sistema: "
	uptime
}

function apagarReiniciar(){
	echo "Introduce 0 para apagar el equipo o 6 para reiniciar el sistema: "
	read opcion
	if [ $opcion -eq 0 ]; then
		echo "Apagando equipo..."
		sudo shutdown -h now
	elif [ $opcion -eq 6 ]; then
		echo "Reiniciando sistema..."
		sudo reboot
	else
		echo "Opción inválida"
	fi
}

# Main Function

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts ":ansvmwtucbeoh:" arg; do
		case $arg in
			a) mostrarDiscos; let parameter_counter+=1 ;;
			n) mostrarDiscoActual; let parameter_counter+=1 ;;
			s) mostrarSistemaOperativo; let parameter_counter+=1 ;;
			v) mostrarVersionSistemaOperativo; let parameter_counter+=1 ;;
			m) mostrarMemoriaRAM; let parameter_counter+=1 ;;
			w) mostrarMemoriaSwap; let parameter_counter+=1 ;;
			t) mostrarParticionesDiscos; let parameter_counter+=1 ;;
			u) mostrarMemoriaSwapRAM; let parameter_counter+=1 ;;
			c) mostrarInfoCPU; let parameter_counter+=1 ;;
			b) mostrarUltimoReinicio; let parameter_counter+=1 ;;
			e) mostrarTiempoUso; let parameter_counter+=1 ;;
			o) apagarReiniciar; let parameter_counter+=1 ;;
			h) helpPanel;;
		esac
	done

	if [ $parameter_counter -ne 2 ]; then
		helpPanel
	else
		mostrarDiscos
		mostrarDiscoActual
		mostrarSistemaOperativo
		mostrarVersionSistemaOperativo
		mostrarMemoriaRAM
		mostrarMemoriaSwap
		mostrarParticionesDiscos
		mostrarMemoriaSwapRAM
		mostrarInfoCPU
		mostrarUltimoReinicio
		mostrarTiempoUso
		# apagarReiniciar
		tput cnorm; 
	fi
else
	echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi
