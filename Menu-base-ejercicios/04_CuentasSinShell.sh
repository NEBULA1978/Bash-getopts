#!/bin/bash
#Construir un script que:
#a) indique los nombres de los diferentes shells asignados a las cuentas de
#usuario en el archivo /etc/passwd y la cantidad de cuentas de cada uno de
#esos shells;
#b) muestre los nombres de cuentas sin shell asignado. 

#a)

# Ejempplo 1

echo  "Shell utilizados: "
cat /etc/passwd | awk -F":" '{print $7}' | grep . | sort | uniq -i -c | sort
echo "Usuarios sin shell: "
cat /etc/passwd | awk -F":" '{if ($7=="") print $1}'

# Ejemplo 2

# Busca en /etc/passwd todos los shells distintos y cuenta la cantidad de usuarios que tienen cada uno
for shell in $(cut -d: -f7 /etc/passwd | sort -u)
do
    count=$(grep -c "^.*:$shell:" /etc/passwd)
    echo "Hay $count cuentas con el shell $shell"
done

# Busca los nombres de usuario sin shell asignado
noshell=$(grep -c '^[^:]*:[^:]*: *$' /etc/passwd)
if [ $noshell -gt 0 ]
then
    echo "Hay $noshell cuentas sin shell asignado"
    grep '^[^:]*:[^:]*: *$' /etc/passwd | cut -d: -f1
fi