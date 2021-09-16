#!/bin/bash

#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

###################
# Función para el menú de sistemas
###################
function manejo_opciones_sistema() {
  case $choice in
    1)
      crear_usuario;;
  esac
}

function crear_usuario() {
  ## SCRIPT PARA LA CREACION DE USUARIOS EN EL SISTEMA OPERATIVO
  local flag=true
  $DIALOG --clear --title "Crear nuevo usuario del sistema" --msgbox "Ingrese los nombres y contraseñas de los usuarios, para terminar deje en blanco el nombre de usuario." 0 0  
  
  while $flag; do
    $DIALOG --clear --title "Ingresar usuario" --inputbox "Ingrese el nombre de usuario" 0 0 2> $tempfile
    if [ $? -ne 0 ]; then
      exit 1
    fi

    USUARIO=$(cat $tempfile)
    if [ -z $USUARIO ]; then
      flag=false
      break
    fi
    
    $DIALOG --clear --title "Ingresar contraseña" --inputbox "Ingrese la contraseña para $USUARIO" 0 0 2> $tempfile
    if [ $? -ne 0 ]; then
      exit 1
    fi
    
    PASS=$(cat $tempfile)
    if [ -z $PASS ]; then
      exit 0
    fi
    
    sudo useradd -m -p $PASS $USUARIO
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Usuario creado" --msgbox "Usuario $USUARIO creado con éxito." 0 0
    else
      $DIALOG --clear --title "Usuario no creado" --msgbox "Ocurrio un error al crear el usuario." 0 0
      exit 1
    fi
  done
}


flag=true;
while $flag; do
  $DIALOG --clear --title "Menú Sistemas" --menu "Elige una opción:" 0 0 0 \
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

./main.sh