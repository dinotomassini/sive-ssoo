#!/bin/bash

####################################################
#   Script con menu para administrar el servidor   #
#            A.F.M. Tech System - 2021             #
####################################################


#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15


###################
# Función para el menú principal
###################
function menuPrincipal() {
  $DIALOG --clear --title "Menú Principal Administrador SIVE" --menu "Eliga una opción:" 0 0 0 \
    1 "Sistema" \
    2 "Base de Datos" \
    3 "Software" \
    4 "Salir" \
    2> $tempfile

  salida_menu=$?
  choice=$(cat $tempfile)

  if [ $salida_menu -eq 0 ]; then
    manejo_opciones_ppal
  else
    exit 0
  fi
}
 
###################
# Función para el manejo de las opciones
###################
function manejo_opciones_ppal() {
  case $choice in
    1)
      ./sistemas.sh;;
    2)
      ./bd.sh;; 
    3)
      ./software.sh;; 
    4)
      salir;;  
  esac
}

function salir() {
  exit 0
}

###################
## PRINCIPAL
###################
menuPrincipal



# # Funcion para devolver el archivo o directorio al dueño
# function es_tuyo() {
#   la_ruta=$1
#   el_duenio=$(ls -l $la_ruta | cut -d " " -f 3)
#   if [[ $el_duenio != $USUARIO ]]; then
#     if [ -f $la_ruta ]; then
#       chown $USUARIO: $la_ruta
#     fi
#     if [ -d $la_ruta ]; then 
#       chown -R $USUARIO: $la_ruta
#     fi
#   fi
# }







#==================================================================
# opciones=("Crear_usuarios" "Respaldar_la_base_de_datos" "Recuperar_la_base_de_datos" "Salir")
# select opt in ${opciones[@]};
# do
#   case $opt in
#     Crear_usuarios)
#       echo "Creando usuarios"
#       ./crearUsuariosSistema.sh
#       ./crearUsuariosDB.sh
#       ./crearBD.sh
#       ;;
#     Respaldar_la_base_de_datos)
#       echo "Respaldando la base de datos"
#       ./crearRespaldo.sh
#       ;;
#     Recuperar_la_base_de_datos)
#       echo "Recuperando la base de datos"
#       ./recuperarRespaldo.sh
#       ;;
#     Salir)
#       echo "Saliendo"
#       break
#       ;;
#     *)
#       echo "La opcion $REPLY no esta implementada, intenta con otra"
#       ;;
#   esac
# done
