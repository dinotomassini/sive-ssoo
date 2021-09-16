#!/bin/bash

######################################################
#   Script con menu para administrar la aplicacion   #
#             A.F.M. Tech System - 2021              #
######################################################

readonly GITHUB_REPO="git@github.com:UTU-ISBO/SIVE-PHP.git"
readonly APP_PATH="/sive"

readonly IP_BACK="172.18.0.22"
readonly HOST_BACK="sive"
readonly PORT_BACK="80:80"
readonly VOLUME_BACK=$APP_PATH:/var/www/html/
readonly IMAGE_BACK="php-mysqli:7.4.16-apache"


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
    3)
      update_app;;
  esac
}

###################
# Función para clonar repositorio
###################
function clone_repo() {
  cd $APP_PATH && git clone $GITHUB_REPO .
  if [ $? -ne 0 ]; then
    $DIALOG --clear --title "Clonando repositorio" --msgbox "Ocurrio un error al clonar el repositorio." 0 0
  fi
    $DIALOG --clear --title "Clonando repositorio" --msgbox "Repositorio clonado con éxito." 0 0
  cd -
}

###################
# Función para levantar la aplicacion
###################
function start_app() {
  docker run --name web -d --ip $IP_BACK --hostname $HOST_BACK -p$PORT_BACK -v $VOLUME_BACK $IMAGE_BACK
  if [ $? -ne 0 ]; then
    docker start web
  fi
  if [ $? -eq 0 ]; then
    $DIALOG --clear --title "Iniciando la APP" --msgbox "Aplicación levantada con éxito." 0 0
  else
    $DIALOG --clear --title "Iniciando la APP" --msgbox "Ocurrio un error al levantar la aplicación." 0 0
    exit 1
  fi
}

###################
# Función para actualizar la aplicacion
###################
function update_app() {
  cd $APP_PATH && git pull
  if [ $? -eq 0 ]; then
    $DIALOG --clear --title "Actualizando la APP" --msgbox "Aplicación actualizada con éxito." 0 0
  else
    $DIALOG --clear --title "Actualizando la APP" --msgbox "Ocurrio un error al actualizar la aplicación." 0 0
    exit 1
  fi
  
  # $DIALOG --clear --title "Actualizando la APP" --msgbox "Aplicación ya actualizada." 0 0
}

###################
# PRINCIPAL
###################
flag=true;
while $flag; do
  $DIALOG --clear --title "Menú de Software" --menu "Elige una opción:" 0 0 0 \
    1 "Traer código de github" \
    2 "Levantar aplicación" \
    3 "Actualizar aplicación" \
    4 "Salir" \
    2> $tempfile

  salida_menu=$?
  choice=$(cat $tempfile)

  if [ $salida_menu -eq 0 ]; then
    if [ $choice -eq 4 ]; then
      flag=false
    fi
    manejo_opciones_software
  else
    exit 0
  fi
done

./main.sh
