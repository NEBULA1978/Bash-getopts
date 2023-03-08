#!/bin/bash

# line_number=45
# lines_to_move=5

# for i in $(seq 1 $lines_to_move)
# do
#   sed -i "${line_number}i\ " Menu12.sh
# done


echo "Introduce la línea de inicio:"
read line_number
echo "Introduce el número de líneas a desplazar:"
read lines_to_move

for i in $(seq 1 $lines_to_move)
do
  sed -i "${line_number}i\ " Menu12.sh
done
