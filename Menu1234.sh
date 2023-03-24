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
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./Menu1234.sh${endColour}"
	echo -e "\n\t${purpleColour}a)${endColour}Introducir ./Menu1234.sh -n  -a${yellowColour} ${endColour}"
	

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
declare -i parameter_counter=0; while getopts ":n:abcdefgijklh" arg; do
case $arg in
n)
case $OPTARG in
a) mostrarDiscos; let parameter_counter+=1 ;;
b) mostrarDiscoActual; let parameter_counter+=1 ;;
c) mostrarSistemaOperativo; let parameter_counter+=1 ;;
d) mostrarVersionSistemaOperativo; let parameter_counter+=1 ;;
e) mostrarMemoriaRAM; let parameter_counter+=1 ;;
f) mostrarMemoriaSwap; let parameter_counter+=1 ;;
g) mostrarParticionesDiscos; let parameter_counter+=1 ;;
h) mostrarMemoriaSwapRAM; let parameter_counter+=1 ;;
i) mostrarInfoCPU; let parameter_counter+=1 ;;
j) mostrarUltimoReinicio; let parameter_counter+=1 ;;
k) mostrarTiempoUso; let parameter_counter+=1 ;;
l) apagarReiniciar; let parameter_counter+=1 ;;
esac
;;
m) echo "La opción ingresada es: $OPTARG"; let parameter_counter+=1 ;;
h) helpPanel;;
esac
done

if [ $parameter_counter -eq 0 ]; then
	helpPanel
fi
tput cnorm; 

else

echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi

# Para ejecutar el programa
# Introducimos de la a...l despues del nombre del script, para ejecutar una opcion con cada letra:
# ./Menu1234.sh -n c
# Información sobre el sistema operativo: 
# Linux next-System 5.15.0-67-generic #74-Ubuntu SMP Wed Feb 22 14:14:39 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux