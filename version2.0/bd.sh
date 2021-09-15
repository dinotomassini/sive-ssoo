#!/bin/bash

#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

###################
# Función para el menú de base de datos
###################
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
  mysql -u $USUARIO -p$PASS
  $DIALOG --clear --title "Creando la base de datos" --msgbox "Estás en el módulo para crear la base de datos." 0 0
}

function crear_tablas() {
  $DIALOG --clear --title "Creando las tablas" --msgbox "Estás en el módulo para crear las tablas necesarias." 0 0  
}

function crear_usuario_bd() {
  $DIALOG --clear --title "Creando usuario" --msgbox "Estás en el módulo para crear usuarios en la base de datos." 0 0  
}

function backup() {
  $DIALOG --clear --title "Respaldando" --msgbox "Estás en el módulo para respaldar." 0 0
}

function restore() {
  $DIALOG --clear --title "Restaurando" --msgbox "Estás en el mádulo para restaurar." 0 0
}


flag=true
while $flag; do
  $DIALOG --clear --title "Menú de Base de Datos" --menu "Elige una opción:" 0 0 0 \
    1 "Crear base de datos" \
    2 "Crear tablas" \
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

./main.sh