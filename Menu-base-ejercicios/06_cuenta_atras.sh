#!/bin/bash

#Crear un script llamado cuenta_atras.sh que nos pida dos números cualesquiera,
#deberá mostrar por pantalla todos los números entre el mayor de los dos introducidos y el menor.
#(Así si introducimos 20 1 nos mostrará los números del 20 al 1, si introducimos 56 89 nos mostrará
#los números del 89 al 56).

if [ $# -ne 2 ]; then
  echo "USO: $0 numero1 numero2"
fi
if [ $1 -gt $2 ]; then
  for ((i = $1; i >= $2; i--)); do
    echo $i
  done
else
  for ((i = $2; i >= $1; i--)); do
    echo $i
  done
fi

# /////////////////////////////////////////////////
# /////////////////////////////////////////////////


echo "Introduce el primer número:"
read num1

echo "Introduce el segundo número:"
read num2

# El código anterior pide al usuario que introduzca dos números, y los almacena en las variables num1 y num2

if [ $num1 -gt $num2 ]
then
  mayor=$num1
  menor=$num2
else
  mayor=$num2
  menor=$num1
fi

# Este bloque de código determina cuál es el número mayor y cuál es el número menor, y los almacena en las variables "mayor" y "menor"

while [ $mayor -ge $menor ]
do
  echo $mayor
  mayor=$((mayor-1))
done

# Este bucle while imprime los números desde el mayor hasta el menor. En cada iteración, se imprime el valor de la variable "mayor", y luego se resta 1 a esa variable para que en la siguiente iteración se imprima el siguiente número menor.
