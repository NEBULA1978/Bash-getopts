#!/bin/bash

# Fichero="banco.txt"
# error() {
#   echo "USO $0 [-a]|[-s][-l]"
#   exit 1
# }

# if [ $# -ne 1 -a $# -ne 2 -a $# -ne 4]; then
#   error
# fi

# case $1 in
# "-a" | "-add")
#   if [ $# -ne 4]; then
#     error
#   fi
#   echo $2 $3 $4 >>$Fichero
#   ;;
# "-s" | "-search") ;;
# "-l" | "-list") ;;
# *) error ;;
# esac


# //////////////////////////////////
# //////////////////////////////////


# Asigna el nombre del archivo a utilizar a la variable "Fichero"
Fichero="banco.txt"

# Define la función "error" para imprimir un mensaje de error y salir del script
error() {
  echo "USO $0 [-a]|[-s][-l]"
  exit 1
}

# Verifica si el número de argumentos es distinto de 1, 2 o 4; si es así, llama a la función "error"
if [ $# -ne 1 -a $# -ne 2 -a $# -ne 4]; then
  error
fi

# Evalúa el primer argumento pasado al script usando "case"
case $1 in
"-a" | "-add")
  # Si el primer argumento es "-a" o "-add", verifica si el número de argumentos es igual a 4;
  # si no es así, llama a la función "error"
  if [ $# -ne 4]; then
    error
  fi
  # Si todo está en orden, añade los siguientes tres argumentos como una nueva línea al final del archivo
  # especificado en la variable "Fichero"
  echo $2 $3 $4 >>$Fichero
  ;;
"-s" | "-search")
  # Si el primer argumento es "-s" o "-search", no hace nada (de momento)
  ;;
"-l" | "-list")
  # Si el primer argumento es "-l" o "-list", no hace nada (de momento)
  ;;
*) 
  # Si el primer argumento no coincide con ninguna de las opciones anteriores, llama a la función "error"
  error 
  ;;
esac
