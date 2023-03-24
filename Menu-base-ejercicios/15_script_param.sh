#!/bin/bash

# #“script_param.sh”: Considere que en el shell actual se dispone de la variable: VAR="nombre=valor1&edad=valor2&telefono=valor3" Escriba un shell-script que analice el valor de dicha variable y para cada uno de los parámetros extraiga su valor y lo imprima por pantalla. Por ejemplo, que la salida sea: Cadena analizada: nombre=valor1&edad=valor2&telefono=valor3
# VAR="nombre=valor1&edad=valor2&telefono=valor3"
# nombre=$(echo $VAR | cut -d"&" -f1)
# edad=$(echo $VAR | cut -d"&" -f2)
# telefono=$(echo $VAR | cut -d"&" -f3)
# nombre=$(echo $nombre | cut -d"=" -f2)
# edad=$(echo $edad | cut -d"=" -f2)
# telefono=$(echo $telefono | cut -d"=" -f2)
# echo $nombre
# echo $edad
# echo $telefono
# IFS='&'
# for i in $VAR; do 
#   echo $(echo $i | cut -d"=" -f2)
# done
# unset IFS

#!/bin/bash

# Definir la variable VAR con los parámetros a analizar
VAR="nombre=valor1&edad=valor2&telefono=valor3"

# Extraer el valor del primer parámetro (nombre) y almacenarlo en una variable
nombre=$(echo $VAR | cut -d"&" -f1)
# Extraer el valor del segundo parámetro (edad) y almacenarlo en una variable
edad=$(echo $VAR | cut -d"&" -f2)
# Extraer el valor del tercer parámetro (telefono) y almacenarlo en una variable
telefono=$(echo $VAR | cut -d"&" -f3)

# Extraer el valor de cada parámetro individualmente utilizando "cut" y almacenarlo en su propia variable
nombre=$(echo $nombre | cut -d"=" -f2)
edad=$(echo $edad | cut -d"=" -f2)
telefono=$(echo $telefono | cut -d"=" -f2)

# Imprimir en pantalla el valor de cada variable
echo $nombre
echo $edad
echo $telefono

# Establecer "&" como el separador de campo interno (IFS) para el ciclo "for"
IFS='&'

# Iterar a través de cada parámetro en VAR utilizando un ciclo "for"
for i in $VAR; do 
  # Extraer el valor de cada parámetro utilizando "cut" y imprimirlo en pantalla
  echo $(echo $i | cut -d"=" -f2)
done

# Restablecer el separador de campo interno (IFS) a su valor predeterminado
unset IFS
