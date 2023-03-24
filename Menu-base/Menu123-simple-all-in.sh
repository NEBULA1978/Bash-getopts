#!/bin/bash


function jugar_ruleta() {
    echo $(( ( RANDOM % 37 ) ))
}

echo "Introduce tu presupuesto inicial:"
read presupuesto
echo "Introduce tu objetivo de dinero a ganar:"
read objetivo

while [ $presupuesto -lt $objetivo ]; do
    apuesta=$presupuesto
    echo "Apuestas $apuesta €"
    
    echo "Selecciona una opción:"
    echo "1. Apuesta directa (1 número)"
    echo "2. Columna (12 números)"
    echo "3. Fila (12 números)"
    echo "4. Esquina (4 números)"
    read opcion

    resultado_ruleta=$(jugar_ruleta)
    echo "La bola ha caído en el número $resultado_ruleta"
    ganado=false

    case $opcion in
        1)
            echo "Escribe tu número elegido (0-36):"
            read numero
            if [ $resultado_ruleta -eq $numero ]; then
                ganancia=$(( apuesta * 36 ))
                ganado=true
            fi
            ;;
        2)
            echo "Escribe la columna en la que deseas apostar (1-3):"
            read columna
            if [ $(( ( resultado_ruleta - 1 ) % 3 + 1 )) -eq $columna ]; then
                ganancia=$(( apuesta * 3 ))
                ganado=true
            fi
            ;;
        3)
            echo "Escribe la fila en la que deseas apostar (1-3):"
            read fila
            if [ $(( ( resultado_ruleta - 1 ) / 12 + 1 )) -eq $fila ]; then
                ganancia=$(( apuesta * 3 ))
                ganado=true
            fi
            ;;
        4)
            echo "Escribe el número de esquina en la que deseas apostar (1-22):"
            read esquina
            if [ $(( ( resultado_ruleta - 1 ) / 4 + 1 )) -eq $esquina ]; then
                ganancia=$(( apuesta * 9 ))
                ganado=true
            fi
            ;;
    esac

    if [ "$ganado" = true ]; then
        echo "¡Has ganado! Tu ganancia es de $ganancia €"
        presupuesto=$(( presupuesto + ganancia ))
    else
        echo "¡Has perdido!"
        presupuesto=$(( presupuesto - apuesta ))
    fi

    if [ $presupuesto -le 0 ]; then
        echo "No tienes más dinero para apostar. Fin del juego."
        break
    fi

    echo "Tu saldo actual es de $presupuesto €"
done

if [ $presupuesto -ge $objetivo ]; then
    echo "¡Felicidades! Has alcanzado tu objetivo de $objetivo €"
fi

# Reusltado por consola

# root@next-System:/home/next/Escritorio/Bash-getopts/Menu-base# ./Menu123-simple-all-in.sh
# Introduce tu presupuesto inicial:
# 10000
# Introduce tu objetivo de dinero a ganar:
# 10
# ¡Felicidades! Has alcanzado tu objetivo de 10 €
# root@next-System:/home/next/Escritorio/Bash-getopts/Menu-base# 

# Este código ahora incluye las opciones para apostar a columnas, filas y esquinas. Por favor, ten en cuenta que este código es solo un ejemplo y no garantiza ganancias en un juego de azar como la ruleta.



# /7777777777///////////////////////
# /7777777777///////////////////////

# function jugar_ruleta() {
#     echo $(( ( RANDOM % 37 ) ))
# }

# echo "Introduce tu presupuesto inicial:"
# read presupuesto
# echo "Introduce tu objetivo de dinero a ganar:"
# read objetivo

# while [ $presupuesto -lt $objetivo ]; do
#     apuesta=$presupuesto
#     echo "Apuestas $apuesta €"
    
#     echo "Selecciona una opción:"
#     echo "1. Apuesta directa (1 número)"
#     echo "2. Columna (12 números)"
#     echo "3. Fila (12 números)"
#     echo "4. Esquina (4 números)"
#     read opcion

#     resultado_ruleta=$(jugar_ruleta)
#     echo "La bola ha caído en el número $resultado_ruleta"

#     case $opcion in
#         1)
#             echo "Escribe tu número elegido (0-36):"
#             read numero
#             if [ $resultado_ruleta -eq $numero ]; then
#                 ganancia=$(( apuesta * 36 ))
#                 echo "¡Has ganado! Tu ganancia es de $ganancia €"
#                 presupuesto=$(( presupuesto + ganancia ))
#             else
#                 echo "¡Has perdido!"
#                 presupuesto=$(( presupuesto - apuesta ))
#             fi
#             ;;
#         2)
#             # ... Similar al caso 1, pero con apuestas de columna
#             ;;
#         3)
#             # ... Similar al caso 1, pero con apuestas de fila
#             ;;
#         4)
#             # ... Similar al caso 1, pero con apuestas de esquina
#             ;;
#     esac

#     if [ $presupuesto -le 0 ]; then
#         echo "No tienes más dinero para apostar. Fin del juego."
#         break
#     fi

#     echo "Tu saldo actual es de $presupuesto €"
# done

# if [ $presupuesto -ge $objetivo ]; then
#     echo "¡Felicidades! Has alcanzado tu objetivo de $objetivo €"
# fi

# Este código te permite ingresar tu presupuesto inicial y el objetivo de dinero a ganar. Luego, puedes elegir entre distintas opciones de apuestas y el juego continuará mientras no alcances tu objetivo o pierdas todo tu presupuesto.

# Ten en cuenta que este código solo incluye el caso de apuesta directa (1 número) y he dejado comentarios en los otros casos (columna, fila, esquina) para que puedas agregarlos siguiendo un enfoque similar al caso 1. Este código solo sirve como ejemplo y no garantiza ganancias en un juego de azar como la ruleta.