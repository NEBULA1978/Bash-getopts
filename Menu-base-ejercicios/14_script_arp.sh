#!bin/bash

#“script_arp.sh”: script que reciba como argumento un número entero, guardándolo en la variable "POS_ARP". El script comprobará si el valor de la variable “POS_ARP” es un número entero positivo, de modo que:
# Si es así: el script calculará el número de entradas que actualmente tiene la caché ARP del equipo, guardándolo en la variable “NENTRADAS”. Si el valor de “POS_ARP” es mayor que “NENTRADAS”, imprimirá por pantalla un mensaje tal como: “Ninguna entrada ARP en la posición valor_POS_ARP”. En caso de que “POS_ARP” sea menor o igual que “NENTRADAS”, imprimirá por pantalla un mensaje con la posición de la entrada ARP “POS_ARP”, seguido del contenido de dicha entrada ARP, e.g.: “Entrada valor_POS_ARP de la caché ARP: 172.16.17.254 ether 00:13:f7:0a:18:8b C eth0 “.
# En otro caso: Imprimirá por pantalla un mensaje indicando que el valor indicado no es un número entero: “Posición de entrada ARP no válida”

# if [ $# -ne 1 ]; then
#   echo "USO: $0 numero"
#   exit 1
# fi
# POS_ARP=$1
# if [ $(($1 * 1)) -lt 1 ]; then
#   echo "No es numero entero positivo"
#   exit
# fi
# cont=0
# encontrado=0
# # Opcion 1
# arp >"temp.txt"
# while read linea; do
#   if [ $cont -eq $POS_ARP ]; then

#     echo "Entrada valor $POS_ARP de la cache ARP: $linea"
#     encontrado=1
#   fi
#   cont=$(($cont + 1))
# done <"temp.txt"
# if [ $encontrado -eq 0 ]; then
#   echo "Posición de entrada ARP no válida"
# fi

# # Opcion 2
# linea2=$(arp | awk -v pos=$POS_ARP '{if (NR==pos+1) print $n}')
# echo "Entrada valor $POS_ARP de la cache ARP: $linea2"


# /////////////////////////////////////////////
# /////////////////////////////////////////////


# Check if the argument is an integer
if [[ $1 =~ ^[0-9]+$ ]]; then
  # Save the integer argument in the variable POS_ARP
  POS_ARP=$1
  # Get the number of entries in the ARP cache
  NENTRADAS=$(arp -an | wc -l)
  # Check if the position is within the range of entries in the ARP cache
  if (( $POS_ARP > $NENTRADAS )); then
    echo "No ARP entry at position $POS_ARP"
  else
    # Get the content of the ARP entry at the specified position
    ARP_ENTRY=$(arp -an | sed -n "${POS_ARP}p")
    echo "ARP cache entry $POS_ARP: $ARP_ENTRY"
  fi
else
  echo "Invalid ARP entry position"
fi






# Note that the script uses the arp command to obtain information about the ARP cache, and the sed command to extract the content of a specific ARP entry based on its position. The script also uses some Bash built-in features, such as the [[ operator for pattern matching, and the (( operator for arithmetic operations. ¿en castellano

# Nota que el script utiliza el comando arp para obtener información sobre la caché ARP, y el comando sed para extraer el contenido de una entrada ARP específica según su posición. El script también utiliza algunas características integradas de Bash, como el operador [[ para comparación de patrones, y el operador (( para operaciones aritméticas.