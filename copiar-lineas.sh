#!/bin/bash

# start_line=36
# end_line=41

# lines_to_copy=$(sed -n "${start_line},${end_line}p" Menu2.sh)

# insert_line=45

# sed -i "${insert_line}i\ ${lines_to_copy}" Menu12.sh

# ERROR
# next@next-System:~/Escritorio/Bash-getopts$ ./copiar-lineas.sh 
# sed: -e expresión #1, carácter 133: orden desconocida: «u»





# start_line=36
# end_line=41

# lines_to_copy=$(sed -n "${start_line},${end_line}p" Menu2.sh | sed 's/[\&\;\(\)\<\>\|\^\~\`\$\*\?\[\]\{\}\!\#\+\-\=\:\,\ ]/\\&/g')

# insert_line=45

# sed -i "${insert_line}i\ ${lines_to_copy}" Menu12.sh


start_line=36
end_line=41

lines_to_copy=$(sed -n "${start_line},${end_line}p" Menu2.sh | sed 's/[\&\;\(\)\<\>\|\^\~\`\$\*\?\[\]\{\}\!\#\+\-\=\:\,\ ]/\\&/g')

insert_line=45

sed -i "${insert_line}i\ ${lines_to_copy}" Menu12.sh

# ERROR
# sed: -e expresión #1, carácter 60: Contenido de \{\} inválido