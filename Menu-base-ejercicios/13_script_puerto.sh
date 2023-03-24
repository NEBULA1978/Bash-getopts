#!/bin/bash

# # “script_puerto.sh”: script que reciba como argumento un número de puerto TCP (PUERTO) y comprobará si el valor es un número entero positivo en el rango “[1, 1023]”, de modo que:
# # Si es así: el script analizará si los puertos TCP “PUERTO” y “PUERTO+1” del equipo local se encuentran a la escucha. Tras ello, imprimirá un mensaje indicando el estado obtenido. Para ello, puede analizar la salida del comando "netstat".
# # En otro caso: imprimirá por pantalla un mensaje indicando que el valor indicado no es un puerto de sistema.
# if [ $# -ne 1 ]; then
#   echo "Error al menos un parámetro"
#   exit 1
# fi

# if [ $(($1*1)) -gt 0 ] && [ $(($1*1)) -lt 1024 ]; then
#   echo "En rango"
# puerto1=$(netstat -putona 2> /dev/null | grep ":$1" | awk '{print $6}'| grep "ESCUCHAR")
# puerto2=$(netstat -putona 2> /dev/null | grep ":$(($1+1))" | awk '{print $6}'| grep "ESCUCHAR")
# if [ -n "$puerto1" ]; then
#   echo $1 "Está escuchando"
# else
#   echo $1 "No Está escuchando"
# fi
# if [ -n "$puerto2" ]; then
#   echo $(($1+1)) "Está escuchando"
# else
#   echo $(($1+1)) "No Está escuchando"
# fi
# else
#   echo "El parámetro tiene que estar entre 1 y 1023"
#   exit 1
# fi

# ///////////////////////////////////////
# ///////////////////////////////////////


# Verificar que el script tenga exactamente un argumento
if [ $# -ne 1 ]; then
  echo "Error: se requiere exactamente un argumento."
  exit 1
fi

# Definir variables para los mensajes
PORT=$1
RANGE_ERROR_MSG="Error: el argumento debe estar en el rango [1, 1023]."
FORMAT_ERROR_MSG="Error: el argumento debe ser un número entero positivo."
LISTENING_MSG="$PORT está escuchando."
NOT_LISTENING_MSG="$PORT no está escuchando."

# Verificar que el argumento sea un número entero positivo en el rango [1, 1023]
if ! echo "$PORT" | grep -Eq '^[0-9]+$'; then
  echo "$FORMAT_ERROR_MSG"
  exit 1
fi

if [ "$PORT" -lt 1 ] || [ "$PORT" -gt 1023 ]; then
  echo "$RANGE_ERROR_MSG"
  exit 1
fi

# Verificar si los puertos TCP están escuchando
puerto1=$(netstat -putona 2> /dev/null | grep ":$PORT" | awk '{print $6}'| grep "ESCUCHAR")
puerto2=$(netstat -putona 2> /dev/null | grep ":$(($PORT+1))" | awk '{print $6}'| grep "ESCUCHAR")

# Imprimir los mensajes correspondientes
if [ -n "$puerto1" ]; then
  echo "$LISTENING_MSG"
else
  echo "$NOT_LISTENING_MSG"
fi

if [ -n "$puerto2" ]; then
  echo "$(($PORT+1)) está escuchando."
else
  echo "$(($PORT+1)) no está escuchando."
fi
