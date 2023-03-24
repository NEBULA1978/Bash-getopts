# #! /bin/bash
# # función de ayuda
# function ayuda() {
# cat << DESCRPCION_AYUDA
# SYNOPSIS
# $0 NUMERO_1 NUMERO_2
# DESCRIPCIóN
# Retorna la suma de NUMERO_1 y NUMERO_2
# CÓDIGOS DE RETORNO
# 1 Si el número de parámetros es distinto de 2
# 2 Si algún parámetro no es un número
# DESCRPCION_AYUDA
# }

# function comprobarQueNoEsNumero() {
# if [ -n "$1" -a "$1" != "0" -a "`echo $1 | awk '{ print $1*1 }'`" != "$1" ]; then
# echo "El parámetro '$1' no es un número"
# ayuda
# exit 2
# fi
# }
# if [ $# -ne 2 ]; then
# echo "El número de parámetros debe de ser igual a 2"
# ayuda
# exit 1
# fi
# comprobarQueNoEsNumero $1
# comprobarQueNoEsNumero $2
# echo $1 $2 | awk '{ print $1 + $2 }'
# echo $(($1+$2))

#! /bin/bash
# función de ayuda
function ayuda() {
    # Aquí se define la función "ayuda" que se usará para mostrar un mensaje de ayuda sobre cómo usar el script. El texto está contenido dentro de una cadena heredoc para poder escribir varias líneas.
    cat <<DESCRPCION_AYUDA
SYNOPSIS
$0 NUMERO_1 NUMERO_2
DESCRIPCIóN
Retorna la suma de NUMERO_1 y NUMERO_2
CÓDIGOS DE RETORNO
1 Si el número de parámetros es distinto de 2
2 Si algún parámetro no es un número
DESCRPCION_AYUDA
}

function comprobarQueNoEsNumero() {
    # Aquí se define la función "comprobarQueNoEsNumero", que se utilizará para comprobar que un argumento es un número. Si no lo es, muestra un mensaje de error y llama a la función "ayuda".
    if [ -n "$1" -a "$1" != "0" -a "$(echo $1 | awk '{ print $1*1 }')" != "$1" ]; then
        echo "El parámetro '$1' no es un número"
        ayuda
        exit 2
    fi
}

if [ $# -ne 2 ]; then
    # Aquí se comprueba que se hayan proporcionado exactamente dos argumentos. Si no es así, muestra un mensaje de error y llama a la función "ayuda".
    echo "El número de parámetros debe de ser igual a 2"
    ayuda
    exit 1
fi

comprobarQueNoEsNumero $1
comprobarQueNoEsNumero $2
# Aquí se realiza la suma de los dos argumentos y se muestra el resultado en pantalla utilizando awk y aritmética básica de Bash.
echo $1 $2 | awk '{ print $1 + $2 }'
# También se muestra el resultado utilizando la expansión aritmética de Bash.
echo $(($1 + $2))

