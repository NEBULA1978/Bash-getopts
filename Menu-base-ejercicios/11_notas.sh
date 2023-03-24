#!/bin/bash

#   exam1=0
#   exam2=0
#   exam3=0
#   media=0
#   mediaFinal=0.0
#   cont=0
#   aptos=0
#   echo "+---------------------------------------+-------+-------+"
#   echo "+ Nombre	EX1	EX2	EX3	+  MED  + APTO  +"
#   echo "+---------------------------------------+-------+-------+"
# while read linea;do
#   cont=$((cont + 1))
#   nota1=$(echo $linea | awk '{print $2}')
#   nota2=$(echo $linea | awk '{print $3}')
#   nota3=$(echo $linea | awk '{print $4}')
#   exam1=$(echo "scale=1;$exam1 + $nota1" | bc)
#   exam2=$(echo "scale=1;$exam2 + $nota3" | bc)
#   exam3=$(echo "scale=1;$exam3 + $nota3" | bc)
#   media=$(echo "scale=1;($nota1 + $nota2 + $nota3)/3" | bc)
#   mediaFinal=$(echo "scale=1;$mediaFinal + $media" | bc)
#   echo -n "+ "
#   echo -n $(echo $linea | awk '{print $1}')
#   echo -n -e "\t"$nota1
#   echo -n -e "\t"$nota2
#   echo -n -e "\t"$nota3
#   echo -n -e "\t+  "$media
#   mediaEntera=$(echo "scale=0;$media/1" | bc)
#   if [ $mediaEntera -ge 5 ]; then
#     echo -n -e "\t+  SI"
#     aptos=$((aptos + 1))
#   else
#     echo -n -e "\t+  NO"
#   fi
#   echo -e "\t+"
# done < "notas.csv"

#   echo "+---------------------------------------+-------+-------+"
#   echo -n "+ TOTAL"
#   echo  -n -e "\t\t"$(echo "scale=1;$exam1/$cont" | bc)
#   echo  -n -e "\t"$(echo "scale=1;$exam2/$cont" | bc)
#   echo  -n -e "\t"$(echo "scale=1;$exam3/$cont" | bc)
#   echo  -n -e "\t+ "$(echo "scale=1;$mediaFinal/$cont" | bc)
#   echo -e "\t+  "$aptos"\t+"
#   echo "+---------------------------------------+-------+-------+"

#!/bin/bash

#!/bin/bash

exam1=0        # inicializa la variable exam1 en cero
exam2=0        # inicializa la variable exam2 en cero
exam3=0        # inicializa la variable exam3 en cero
media=0        # inicializa la variable media en cero
mediaFinal=0.0 # inicializa la variable mediaFinal en cero como un número de punto flotante
cont=0         # inicializa la variable cont en cero
aptos=0        # inicializa la variable aptos en cero
echo "+---------------------------------------+-------+-------+"
echo "+ Nombre  EX1   EX2   EX3   +  MED  + APTO  +"
echo "+---------------------------------------+-------+-------+"
while read linea; do
  cont=$((cont + 1))                                        # incrementa la variable cont en uno
  nota1=$(echo $linea | awk '{print $2}')                   # extrae la nota1 de la línea actual
  nota2=$(echo $linea | awk '{print $3}')                   # extrae la nota2 de la línea actual
  nota3=$(echo $linea | awk '{print $4}')                   # extrae la nota3 de la línea actual
  exam1=$(echo "scale=1;$exam1 + $nota1" | bc)              # acumula la nota1 en exam1
  exam2=$(echo "scale=1;$exam2 + $nota3" | bc)              # acumula la nota2 en exam2
  exam3=$(echo "scale=1;$exam3 + $nota3" | bc)              # acumula la nota3 en exam3
  media=$(echo "scale=1;($nota1 + $nota2 + $nota3)/3" | bc) # calcula la media de las notas
  mediaFinal=$(echo "scale=1;$mediaFinal + $media" | bc)    # acumula la media en mediaFinal
  echo -n "+ "
  echo -n $(echo $linea | awk '{print $1}')   # extrae el nombre del estudiante de la línea actual
  echo -n -e "\t"$nota1                       # imprime la nota1 del estudiante actual
  echo -n -e "\t"$nota2                       # imprime la nota2 del estudiante actual
  echo -n -e "\t"$nota3                       # imprime la nota3 del estudiante actual
  echo -n -e "\t+  "$media                    # imprime la media de las notas del estudiante actual
  mediaEntera=$(echo "scale=0;$media/1" | bc) # redondea la media del estudiante actual a un número entero
  if [ $mediaEntera -ge 5 ]; then             # verifica si la media del estudiante actual es mayor o igual a 5
    echo -n -e "\t+  SI"                      # si es así, imprime 'SI' en la columna APTO
    aptos=$((aptos + 1))                      # y aumenta en uno la variable aptos
  else
    echo -n -e "\t+  NO" # si no, imprime 'NO' en la columna APTO
  fi
  echo -e "\t+"
done <"notas.csv"
