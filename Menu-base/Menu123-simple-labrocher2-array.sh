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
    echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./Menu12.sh${endColour}"
    echo -e "\n\t${purpleColour}a)${endColour}Introducir ./Menu12.sh -a para mostrar las particiones de discos\n"
    echo -e "\t${purpleColour}b)${endColour}Introducir ./Menu12.sh -b para ejecutar la estrategia Labouchere\n"
    exit 0
}

function mostrarDiscos() {
    tput civis
    echo "Particiones de discos: "
    sudo fdisk -l
}

# function labouchereStrategy(){
#     echo "¿Cuánto dinero quieres ingresar?"
#     read suma
#     echo "¿Quieres apostar a pares o impares? (responde 'par' o 'impar')"
#     read parOImpar

#     if [ "$parOImpar" != "par" ] && [ "$parOImpar" != "impar" ]; then
#         echo "Opción inválida. Debes elegir 'par' o 'impar'."
#         exit 1
#     fi

#     serie=(1 2 3 4 5 6)

#     echo "Bienvenido a la ruleta. Tu saldo inicial es de $suma"

#     while (( suma > 0 && ${#serie[@]} > 1 )); do
#         apuesta=$(( serie[0] + serie[-1] ))
#         echo "Serie actual: ${serie[*]}"
#         echo "Apuesta actual: $apuesta"

#         if (( apuesta <= suma )); then
#             numero=$(( RANDOM % 37 ))
#             echo "La bola ha caído en el número $numero"

#             if [ "$parOImpar" == "par" ]; then
#                 if (( numero % 2 == 0 && numero != 0 )); then
#                     echo "¡Has ganado!"
#                     serie=( "${serie[@]:1:${#serie[@]}-2}" )
#                 else
#                     echo "¡Has perdido!"
#                     serie+=( $apuesta )
#                 fi
#             elif [ "$parOImpar" == "impar" ]; then
#                 if (( numero % 2 == 1 )); then
#                     echo "¡Has ganado!"
#                     serie=( "${serie[@]:1:${#serie[@]}-2}" )
#                 else
#                     echo "¡Has perdido!"
#                     serie+=( $apuesta )
#                 fi
#             fi

#             suma=$(( suma - apuesta ))
#         else
#             echo "No tienes suficiente dinero para apostar esa cantidad"
#             break
#         fi
#     done

#     if (( ${#serie[@]} <= 1 )); then
#         echo "¡Felicidades! Has completado la serie Labouchere y ganado $(( serie[0] * 2 ))"
#     fi

#     echo "Has terminado de jugar"
#     echo "Tu saldo final es de $suma"
# }

function labouchereStrategy() {
    echo "¿Cuánto dinero quieres ingresar?"
    read suma
    echo "¿Quieres apostar a pares o impares? (responde 'par' o 'impar')"
    read parOImpar

    if [ "$parOImpar" != "par" ] && [ "$parOImpar" != "impar" ]; then
        echo "Opción inválida. Debes elegir 'par' o 'impar'."
        exit 1
    fi

    serie=(1 2 3 4 5 6)

    echo "Bienvenido a la ruleta. Tu saldo inicial es de $suma"

    while (( suma > 0 && ${#serie[@]} > 1 )); do
        apuesta=$(( serie[0] + serie[-1] ))
        echo "Serie actual: ${serie[*]}"
        echo "Apuesta actual: $apuesta"

        if (( apuesta <= suma )); then
            numero=$(( RANDOM % 37 ))
            echo "La bola ha caído en el número $numero"

            if [ "$parOImpar" == "par" ]; then
                if (( numero % 2 == 0 && numero != 0 )); then
                    echo "¡Has ganado!"
                    serie=( "${serie[@]:1:${#serie[@]}-2}" )
                else
                    echo "¡Has perdido!"
                    serie+=( $apuesta )
                fi
            elif [ "$parOImpar" == "impar" ]; then
                if (( numero % 2 == 1 )); then
                    echo "¡Has ganado!"
                    serie=( "${serie[@]:1:${#serie[@]}-2}" )
                else
                    echo "¡Has perdido!"
                    serie+=( $apuesta )
                fi
            fi

            suma=$(( suma - apuesta ))
        else
            echo "No tienes suficiente dinero para apostar esa cantidad"
            break
        fi
    done

    if (( ${#serie[@]} <= 1 )); then
        echo "¡Felicidades! Has completado la serie Labouchere y ganado $(( serie[0] * 2 ))"
    fi

    echo "Has terminado de jugar"
    echo "Tu saldo final es de $suma"
}

# Este script aplica los conceptos de arrays, bucles e interacción con el usuario para implementar la estrategia Labouchere en un juego de ruleta. El usuario ingresa la cantidad de dinero que desea apostar y si desea apostar a números pares o impares. Luego, el script realiza la apuesta siguiendo la serie Labouchere y muestra los resultados.


# Main Function

if [ "$(id -u)" == "0" ]; then
    declare -i parameter_counter=0
    while getopts ":ab" arg; do
        case $arg in
        b)
            labouchereStrategy
            let parameter_counter+=1
            ;;
        *) helpPanel ;;
        esac
    done

    if [ $parameter_counter -eq 0 ]; then
        helpPanel
    fi
    tput cnorm
else
    echo -e "\n${redColour}[*] No soy root${endColour}\n"
fi

# código proporcionado sigue las reglas de la estrategia Labouchere que mencionas:

#     Toma una serie de seis números: serie=(1 2 3 4 5 6)
#     La primera apuesta es la suma de los números en los extremos de la serie: apuesta=$(( ${serie[0]} + ${serie[-1]} ))
#     El usuario elige apostar a pares o impares, que son apuestas de probabilidad equilibrada.
#     Si gana, se eliminan los números en los extremos de la serie: serie=("${serie[@]:1:${#serie[@]}-2}")
#     Si pierde, se agrega la suma de los extremos al final de la serie: serie+=($apuesta)
    # El objetivo es eliminar todos los números de la serie. Si se logra, el jugador gana un importe igual a la suma de los números de la serie original.

# El código cumple con estas reglas y simula la estrategia Labouchere en el juego de la ruleta. Sin embargo, es importante recordar que ninguna estrategia garantiza ganancias en un juego de azar como la ruleta.