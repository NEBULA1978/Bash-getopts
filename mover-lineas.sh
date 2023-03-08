#!/bin/bash

line_number=47
end_line=53

for ((i=line_number; i<=end_line; i++))
do
  current_line=$(sed "${i}q;d" Menu12.sh)
  if [ ! -z "$current_line" ]; then
    for ((j=end_line; j>=i; j--))
    do
      next_line=$(sed "${j}q;d" Menu12.sh)
      sed -i "${j}s/.*/$current_line/" Menu12.sh
      current_line="$next_line"
    done
    sed -i "${i}s/.*/ /" Menu12.sh
  fi
done

# Este script lee cada línea en el archivo Menu12.sh desde la línea 47 hasta la línea 53. Si la línea actual no está vacía, entonces mueve cada línea hacia abajo hasta la línea 53.