# Bash-getopts

Para ehecutar hay que ser root(sudo su):
Menu1.sh:
./Menu1.sh -a hola -n adios nos muestra el resultado de estas dos funciones:

function mostrarParticionesDiscos(){
	tput civis
  # echo "Hola $saludar"
	echo "Particiones de discos: "
	sudo fdisk -l

}

function mostrarMemoriaSwapRAM(){
  # echo "Adios $despedir"
	echo "Datos sobre memoria RAM y swap usada y libre: "
	free -h
}
Para ehecutar hay que ser root(sudo su):
Menu2.sh:
./Menu1.sh -a  -n  nos muestra el resultado de estas dos funciones sin introducir parametros:

function mostrarParticionesDiscos(){
	tput civis
  # echo "Hola $saludar"
	echo "Particiones de discos: "
	sudo fdisk -l

}

function mostrarMemoriaSwapRAM(){
  # echo "Adios $despedir"
	echo "Datos sobre memoria RAM y swap usada y libre: "
	free -h
}
