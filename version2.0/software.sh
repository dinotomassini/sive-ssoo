#!/bin/bash

#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

###################
# Función para el menú de software
###################
function manejo_opciones_software() {
  case $choice in
    1)
      clone_repo;;
    2)
      start_app;;
  esac
}

function clone_repo() {
  URL=""
  cd ~ && git clone $URL
  if [ $? -ne 0 ]; then
    $DIALOG --clear --title "Clonando repositorio" --msgbox "Ocurrio un error al clonar el repositorio." 0 0
  fi
    $DIALOG --clear --title "Clonando repositorio" --msgbox "Repositorio clonado con éxito." 0 0
  cd -
}

function start_app() {
  DOCKER_PATH=""
  docker run --help
  if [ $? -ne 0 ]; then
    $DIALOG --clear --title "Iniciando la APP" --msgbox "Ocurrio un error al levantar la aplicación." 0 0
  fi
  $DIALOG --clear --title "Iniciando la APP" --msgbox "Aplicación levantada con éxito." 0 0
}


flag=true;
while $flag; do
  $DIALOG --clear --title "Menú de Software" --menu "Elige una opción:" 0 0 0 \
    1 "Traer código de github" \
    2 "Levantar aplicación" \
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

./main.sh