	echo -e "\n\t${purpleColour}m)${endColour}${yellowColour} Muestra la memoria RAM ${endColour}"
	echo -e "\n\t${purpleColour}w)${endColour}${yellowColour} Muestra la memoria swap ${endColour}"
	echo -e "\n\t${purpleColour}t)${endColour}${yellowColour} Muestra particiones de discos (detalles) ${endColour}"
	echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} Muestra datos sobre la memoria RAM y swap usada y libre ${endColour}"
	echo -e "\n\t${purpleColour}c)${endColour}${yellowColour} Muestra información sobre la CPU ${endColour}"
	echo -e "\n\t${purpleColour}b)${endColour}${yellowColour} Muestra información sobre el último reinicio del sistema ${endColour}"
	echo -e "\n\t${purpleColour}e)${endColour}${yellowColour} Muestra el tiempo de uso del sistema ${endColour}"
	echo -e "\n\t${purpleColour}o)${endColour}${yellowColour} Apaga o reinicia el sistema ${endColour}"
	echo -e "\n\t${purpleColour}h)${endColour}${yellowColour} Muestra esta ayuda ${endColour}"

	exit 0
}

function saludar(){
	tput civis
	echo "Hola $saludar"
}

function despedir(){
	echo "Adios $despedir"
}

function mostrarDiscos(){
	echo "Adios $mostrarDiscos"
	echo "Información sobre los discos: "
	df -h
}

function mostrarDiscoActual(){
		echo "Adios $mostrarDiscoActual"

	echo "Información sobre el disco que contiene el directorio actual: "
	df -h .
}

function mostrarSistemaOperativo(){
	echo "Adios $mostrarSistemaOperativo"

	echo "Información sobre el sistema operativo: "
	uname -a
}

function mostrarVersionSistemaOperativo(){
		echo "Adios $mostrarVersionSistemaOperativo"

	echo "Versión del sistema operativo: "
	lsb_release -a
}

function mostrarMemoriaRAM(){
	echo "Adios $mostrarMemoriaRAM"

	echo "Memoria RAM: "
	grep MemTotal /proc/meminfo
}

function mostrarMemoriaSwap(){
	echo "Adios $mostrarMemoriaSwap"

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

	declare -i parameter_counter=0; while getopts ":a:n:d:p:s:v:m:w:t:u:c:b:e:o:h:" arg; do
		case $arg in
			a) saludar=$OPTARG; let parameter_counter+=1 ;;
			n) despedir=$OPTARG; let parameter_counter+=1 ;;
			d) mostrarDiscos; let parameter_counter+=1 ;;
			p) mostrarDiscoActual; let parameter_counter+=1 ;;
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

	if [ $parameter_counter -eq 0 ]; then
		helpPanel
	else
		saludar
		despedir
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
		apagarReiniciar
		tput cnorm;
	fi
else
	echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi

# Este código implementa un menú en un script de shell que muestra información sobre el sistema operativo y el hardware del equipo, y permite al usuario apagar o reiniciar el sistema.

# El menú se presenta en la pantalla y ofrece varias opciones, identificadas por letras, para que el usuario pueda seleccionarlas y ver la información correspondiente. Las opciones disponibles son:

#     m: muestra la memoria RAM del equipo.
#     w: muestra la memoria swap del equipo.
#     t: muestra las particiones de disco del equipo.
#     u: muestra datos sobre la memoria RAM y swap usada y libre.
#     c: muestra información sobre la CPU del equipo.
#     b: muestra información sobre el último reinicio del sistema.
#     e: muestra el tiempo de uso del sistema.
#     o: apaga o reinicia el sistema.
#     h: muestra la ayuda.

# El menú también permite al usuario proporcionar ciertos parámetros opcionales mediante la opción de línea de comando -a, -n, -d, -p, -s, -v, -m, -w, -t, -u, -c, -b, -e, -o o -h, que llamarán a funciones específicas del script para mostrar información adicional.

# En caso de que el script se ejecute sin ninguna opción, el menú mostrará todas las opciones disponibles y solicitará al usuario que seleccione una de ellas. Si se selecciona una opción que requiere permisos de root, el script verificará si se está ejecutando como root y, de lo contrario, emitirá un mensaje de error.