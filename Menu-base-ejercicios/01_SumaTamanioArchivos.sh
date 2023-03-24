#!/bin/bash
# Se desea sumar el espacio ocupado por un usuario en un
#directorio y todos sus subdirectorios. Para ello, deben sumarse los tamaños
#de todos los archivos de ese usuario en esa rama de directorios.
#El script recibirá como parámetros el nombre del usuario y el nombre del
#directorio.
#Validará que el usuario pertenezca al sistema, y que el nombre de
#directorio recibido sea efectivamente un directorio.
#Presentará el resultado total en bytes, Kbytes y Mbytes enteros.
# *Sugerencia:* usar el comando find con listado largo; el tamaño de archivo
#en el listado largo está entre las columnas 47 y 56.  
# if [ $# -ne 2 ];then
#   echo "USO $0 usuario directorio"
#   exit 1
# fi
# existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $1)
# if [ "$existe" = "" ]; then
#   echo "Error: No existe el usuario $1 en el sistema"
#   exit 1
# fi
# if [ ! -d $2 ]; then
#   echo "Error: $2 no es un directorio"
#   exit 1
# fi

# total=$(find $2 -user $1 -exec ls -l {} \; | awk '{total=total+$5}END {print total}')
# echo "$total bytes"
# kbytes=$(($total/1024))
# if [ $kbytes -gt 0 ]; then
#   echo "$kbytes KB"
# fi
# mbytes=$(($kbytes/1024))
# if [ $mbytes -gt 0 ]; then
#   echo "$mbytes MB"
# fi


#!/bin/bash

# Comprobamos que se hayan proporcionado dos argumentos al script
if [ $# -ne 2 ]; then
  echo "Uso: $0 usuario directorio"
  exit 1
fi

# Comprobamos si el usuario dado existe en el sistema
existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $1)
if [ "$existe" = "" ]; then
  echo "Error: No existe el usuario $1 en el sistema"
  exit 1
fi

# Comprobamos si el segundo argumento es un directorio válido
if [ ! -d $2 ]; then
  echo "Error: $2 no es un directorio"
  exit 1
fi

# Buscamos todos los archivos del usuario dado en el directorio dado y sumamos sus tamaños
total=$(find $2 -user $1 -exec ls -l {} \; | awk '{total=total+$5}END {print total}')
echo "$total bytes"

# Convertimos el tamaño total a kilobytes y megabytes si es necesario
kbytes=$(($total/1024))
if [ $kbytes -gt 0 ]; then
  echo "$kbytes KB"
fi
mbytes=$(($kbytes/1024))
if [ $mbytes -gt 0 ]; then
  echo "$mbytes MB"
fi

# Este es un script de shell que verifica si un usuario dado tiene archivos en un directorio dado y muestra el tamaño total de los archivos en bytes, kilobytes y megabytes.

# Primero, el script comprueba que se hayan proporcionado exactamente dos argumentos al script, el nombre del usuario y el directorio a verificar. Si no se proporcionan exactamente dos argumentos, se muestra un mensaje de uso y el script se detiene con un código de salida 1.

# A continuación, el script comprueba si el usuario dado existe en el sistema, utilizando el archivo /etc/passwd. Si el usuario no existe, se muestra un mensaje de error y el script se detiene con un código de salida 1.

# Luego, el script comprueba si el segundo argumento proporcionado es un directorio válido. Si no es así, se muestra un mensaje de error y el script se detiene con un código de salida 1.

# El script luego busca todos los archivos en el directorio dado que pertenecen al usuario dado y utiliza el comando ls y awk para sumar los tamaños de archivo de cada archivo. El tamaño total se guarda en la variable total.

# Finalmente, el script muestra el tamaño total en bytes y convierte el tamaño a kilobytes y megabytes si es necesario. Los tamaños en kilobytes y megabytes se muestran solo si son mayores que cero.