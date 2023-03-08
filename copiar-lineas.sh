total_lines=$(wc -l < Menu12.sh)
start_line=$((47 + total_lines))
sed -i "${start_line}i\
$(sed -n '36,40p' Menu2.sh)" Menu12.sh

# Este comando primero determina el número total de líneas en el archivo Menu12.sh y lo guarda en la variable total_lines. Luego, calcula la línea de inicio agregando el número total de líneas a la línea 47. Finalmente, utiliza el comando sed para agregar las líneas 36 a 40 del archivo Menu2.sh después de la línea de inicio.