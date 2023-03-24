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

function labouchereStrategy() {
    suma=100

    echo "Bienvenido a la ruleta. Tu saldo inicial es de $suma"

    serie=(1 2 3 4 5 6)

    while ((suma > 0 && ${#serie[@]} > 1)); do
        echo "Serie actual: ${serie[*]}"
        apuesta=$((serie[0] + serie[-1]))

        if ((apuesta > 0)); then
            if ((apuesta <= suma)); then
                echo "Apuesta actual: $apuesta"
                echo "Elige una opción:"
                echo "1. Rojo / Negro"
                echo "2. Par / Impar"
                echo "3. Alto / Bajo"
                read -r opcion

                numero=$((RANDOM % 37))

                case $opcion in
                1 | 2 | 3)
                    echo "La bola ha caído en el número $numero"
                    if (((opcion == 1 && (numero % 2 == 1 || numero == 0)) || (opcion == 2 && numero % 2 == 0) || (opcion == 3 && numero >= 1 && numero <= 18))); then
                        echo "¡Has ganado!"
                        serie=("${serie[@]:1:$((${#serie[@]} - 2))}")
                    else
                        echo "¡Has perdido!"
                        serie+=($apuesta)
                    fi
                    suma=$((suma - apuesta))
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

    if ((${#serie[@]} <= 1)); then
        echo "¡Felicidades! Has completado la serie Labouchere y ganado $((${serie[0]} * 2))"
    fi

    echo "Has terminado de jugar"
    echo "Tu saldo final es de $suma"
}

# Main Function

if [ "$(id -u)" == "0" ]; then
    declare -i parameter_counter=0
    while getopts ":ab" arg; do
        case $arg in
        a)
            mostrarDiscos
            let parameter_counter+=1
            ;;
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
# Este código incorpora la función labouchereStrategy en el menú que proporcionaste. La función se ejecutará cuando se pase la opción -b al script. Recuerda guardar el código en un archivo con extensión .sh y darle permisos de ejecución antes de correrlo en tu terminal.


# EJEMPLO POR CONSOLA DE LA JECUCION

# root@next-System:/home/next/Escritorio/Bash-getopts/Menu-base# ./Menu123-simple-labrocher.sh -b
# Bienvenido a la ruleta. Tu saldo inicial es de 100
# Serie actual: 1 2 3 4 5 6
# Apuesta actual: 7
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 26
# ¡Has perdido!
# Serie actual: 1 2 3 4 5 6 7
# Apuesta actual: 8
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 15
# ¡Has ganado!
# Serie actual: 2 3 4 5 6
# Apuesta actual: 8
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo

# Opción inválida
# Serie actual: 2 3 4 5 6
# Apuesta actual: 8
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 31
# ¡Has ganado!
# Serie actual: 3 4 5
# Apuesta actual: 8
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 4
# ¡Has perdido!
# Serie actual: 3 4 5 8
# Apuesta actual: 11
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 19
# ¡Has ganado!
# Serie actual: 4 5
# Apuesta actual: 9
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 4
# ¡Has perdido!
# Serie actual: 4 5 9
# Apuesta actual: 13
# Elige una opción:
# 1. Rojo / Negro
# 2. Par / Impar
# 3. Alto / Bajo
# 1
# La bola ha caído en el número 35
# ¡Has ganado!
# ¡Felicidades! Has completado la serie Labouchere y ganado 10
# Has terminado de jugar
# Tu saldo final es de 36
# root@next-System:/home/next/Escritorio/Bash-getopts/Menu-base#
# describeme

# El script que ejecutaste es una implementación simplificada de la estrategia de ruleta Labouchere en un juego de ruleta simulado utilizando un menú de opciones.

# Cuando ejecutaste el script con la opción -b, se inició la función labouchereStrategy. Esta función simula el juego de ruleta utilizando la estrategia Labouchere. La estrategia funciona de la siguiente manera:

#     Se crea una serie de números (en este caso, 1 2 3 4 5 6).
#     La apuesta es la suma de los primeros y últimos números de la serie (en este caso, 1+6 = 7).
#     El jugador elige una opción de apuesta (rojo/negro, par/impar, alto/bajo).
#     Se genera un número aleatorio (entre 0 y 36) para simular el giro de la ruleta.
#     Si el jugador gana, se eliminan los primeros y últimos números de la serie.
#     Si el jugador pierde, se añade la suma de los primeros y últimos números al final de la serie.
#     El proceso se repite hasta que se eliminen todos los números de la serie o el jugador se quede sin saldo.

# En la salida que proporcionaste, puedes ver cómo se actualiza la serie y las apuestas en cada paso del juego. Al final, completaste la serie Labouchere y ganaste 10 unidades. El saldo final fue de 36 unidades.

# Ten en cuenta que este script es solo una simulación y no debe utilizarse en un entorno real de juego. La estrategia Labouchere no garantiza ganancias y, como todas las estrategias de apuestas, tiene sus riesgos.