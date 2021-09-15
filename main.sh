#!/bin/bash

## SCRIPT PRINCIPAL QUE EJECUTA LOS DEMAS

# sistemas
#   usuarios
#     crear usuarios
#   software
#     clonar repositorio
#     ejecutar APP

# base de datos
#   estructura
#     crear base de datos
#     crear tablas
#   usuarios
#     crear usurio
#   resapaldos
#     realizar respaldo
#     recuperar respaldo


#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# Funcion para el menu
function menuPrincipal() {
  $DIALOG --clear --title "Solucion a errores de APIA" --menu "Elige una opcion:" 0 0 0 \
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
# Funcion para el manejo de las opciones
function manejo_opciones_ppal() {
  case $choice in
    1)
      menu_sistema;;
    2)
      menu_bd;; 
    3)
      menu_software;; 
    4)
      salir;;  
  esac
}


function menu_sistema() {
  flag=true;
  while $flag; do
    $DIALOG --clear --title "Solucion a errores de APIA" --menu "Elige una opcion:" 0 0 0 \
    1 "Crear usuarios del sistema" \
    2 "Salir" \
    2> $tempfile

  salida_menu=$?
  choice=$(cat $tempfile)

  if [ $salida_menu -eq 0 ]; then
    if [ $choice -eq 2 ]; then
      flag=false
    fi
    manejo_opciones_sistema
  else
    exit 0
  fi
done
}
# Funcion para el manejo de las opciones
function manejo_opciones_sistema() {
  case $choice in
    1)
      crear_usuario;;
  esac
}
function crear_usuario() {
  $DIALOG --clear --title "Crear usuario del sistema" --msgbox "Estas en el modulo de crear usuarios del sistema operativo." 0 0
}


function menu_software() {
  flag=true;
  while $flag; do
    $DIALOG --clear --title "Solucion a errores de APIA" --menu "Elige una opcion:" 0 0 0 \
      1 "Traer codigo de github" \
      2 "Levantar aplicacion" \
      3 "Salir" \
      2> $tempfile

    salida_menu=$?
    choice=$(cat $tempfile)

    if [ $salida_menu -eq 0 ]; then
      if [ $choice -eq 3 ]; then
        flag=false
      fi
      manejo_opciones_software
    else
      exit 0
    fi
  done
}
# Funcion para el manejo de las opciones
function manejo_opciones_software() {
  case $choice in
    1)
      clone_repo;;
    2)
      start_app;;   
  esac
}
function clone_repo() {
  $DIALOG --clear --title "Clonando repositorio" --msgbox "Estas en el modulo para clonar el repositorio desde github." 0 0
}
function start_app() {
  $DIALOG --clear --title "Iniciando la APP" --msgbox "Estas en el modulo para iniciar la aplicacion." 0 0
}

function menu_bd() {
  flag=true
  while $flag; do
    $DIALOG --clear --title "Solucion a errores de APIA" --menu "Elige una opcion:" 0 0 0 \
      1 "Crear base de datos" \
      2 "Crear Tablas" \
      3 "Crear usuarios" \
      4 "Respaldar" \
      5 "Recuperar respaldo" \
      6 "Salir" \
      2> $tempfile

    salida_menu=$?
    choice=$(cat $tempfile)

    if [ $salida_menu -eq 0 ]; then
      if [ $choice -eq 6 ]; then
        flag=false
      fi
      manejo_opciones_bd
    else
      exit 0
    fi
  done
}
# Funcion para el manejo de las opciones
function manejo_opciones_bd() {
  case $choice in
    1)
      crear_bd;;
    2)
      crear_tablas;; 
    3)
      crear_usuario_bd;; 
    4)
      backup;;
    5)
      restore;; 
  esac
}
function crear_bd() {
  $DIALOG --clear --title "Creando la base de datos" --msgbox "Estas en el modulo para crear la base de datos." 0 0
}
function crear_tablas() {
  $DIALOG --clear --title "Creando las tablas" --msgbox "Estas en el modulo para crear las tablas necesarias." 0 0  
}
function crear_usuario_bd() {
  $DIALOG --clear --title "Creando usuario" --msgbox "Estas en el modulo para crear usuarios en la base de datos." 0 0  
}
function backup() {
  $DIALOG --clear --title "Respaldando" --msgbox "Estas en el modulo para respaldar." 0 0
}
function restore() {
  $DIALOG --clear --title "Restaurando" --msgbox "Estas en el modulo para restaurar." 0 0
}

function salir() {
  exit 0
}

#################################################
## PRINCIPAL
#################################################
while true; do
  menuPrincipal
done
#################################################


# if [ $exito -eq 1 ]; then
#     $DIALOG --clear --title "Eliminar perfil" --msgbox "Se elimino y creo el nuevo perfil de $USUARIO con exito en Mozilla Firefox." 0 0
#   else
#     $DIALOG --clear --title "Eliminar perfil" --msgbox "No se pudo eliminar o crear el nuevo perfil de $USUARIO en Mozilla Firefox." 0 0
#   fi

#   # Funcion para agregar el usuario para trabajar
# function set_nombre() {
#   $DIALOG --clear --title "Ingresar usuario" --inputbox "Ingrese el nombre de usuario para trabajar en su perfil" 0 0 2> $tempfile
#   if [ $? -ne 0 ]; then
#     exit 1
#   fi
#   USUARIO=$(cat $tempfile)
#   if [ -z $USUARIO ]; then
#     echo "El usuario no puede estar vacio"
#     exit 1
#   fi
#   get_perfil
# }


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
