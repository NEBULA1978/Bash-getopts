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
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./Menu12.sh${endColour}"
	echo -e "\n\t${purpleColour}a)${endColour}Introducir ./Menu12.sh -a para mostrar las particiones de discos\n"
	

	exit 0
}

function mostrarDiscos(){
	tput civis
	echo "Particiones de discos: "
	sudo fdisk -l

}

# Main Function

if [ "$(id -u)" == "0" ]; then
	declare -i parameter_counter=0; while getopts ":ah:" arg; do
		case $arg in
			a) mostrarDiscos; let parameter_counter+=1 ;;
	
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

# Ejemplo funcion sola Labrocher

#!/bin/bash

suma=100
restantes=100

echo "Bienvenido a la ruleta. Tu saldo inicial es de $suma"

serie=(1 2 3 4 5 6)

while (( suma > 0 && ${#serie[@]} > 1 )); do
    echo "Serie actual: ${serie[*]}"
    apuesta=$(( serie[0] + serie[-1] ))

    if (( apuesta > 0 )); then
        if (( apuesta <= suma )); then
            echo "Apuesta actual: $apuesta"
            echo "Elige una opción:"
            echo "1. Rojo / Negro"
            echo "2. Par / Impar"
            echo "3. Alto / Bajo"
            read -r opcion

            numero=$(( RANDOM % 37 ))

            case $opcion in
                1|2|3)
                    echo "La bola ha caído en el número $numero"
                    if (( (opcion == 1 && (numero % 2 == 1 || numero == 0)) || (opcion == 2 && numero % 2 == 0) || (opcion == 3 && numero >= 1 && numero <= 18) )); then
                        echo "¡Has ganado!"
                        serie=( "${serie[@]:1:$(( ${#serie[@]} - 2 ))}" )
                    else
                        echo "¡Has perdido!"
                        serie+=( $apuesta )
                    fi
                    suma=$(( suma - apuesta ))
                    ;;
                *)
                    echo "Opción inválida"
                    ;;
            esac
        else
            echo "No tienes suficiente dinero para apostar esa cantidad"
        fi
    else
        echo "La apuesta debe ser un número positivo"
    fi
done

if (( ${#serie[@]} <= 1 )); then
    echo "¡Felicidades! Has completado la serie Labouchere y ganado $(( ${serie[0]} * 2 ))"
fi

echo "Has terminado de jugar"
echo "Tu saldo final es de $suma"

# Este script ha sido modificado para incorporar la estrategia Labouchere, permitiendo que el usuario apueste según la serie y siga las reglas de esta estrategia. Además, se ha eliminado la opción de apostar en Alto/Medio/Bajo, ya que la estrategia Labouchere se basa en apuestas externas de probabilidad equilibrada como Rojo/Negro, Par/Impar o Alto/Bajo.
