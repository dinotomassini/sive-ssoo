#!/bin/bash

#####################################################################
#   Script con menu para reparar problemas en Firefox que da APIA   #
#                         Utilizando dialog                         #
#                       Dino Tomassini - 2020                       #
#####################################################################

#################################################
## CONFIGURACIONES GLOBALES
#################################################
set -u # termina el script si se utiliza una variable no declarada
#set -e # termina el script si salta un error
#set -x # debugger
#set -v # imprime entradas de la shell
#################################################

#################################################
## VARIABLES GLOBALES
#################################################
#Ruta donde se encuntra Firefox
readonly RUTA_FIREFOX=".mozilla/firefox"

#Ruta del perfil de Firefox
PERFIL="" 

#Ruta absoluta del perfil
RUTA=""

#Nombre de archivos para librerias
readonly LIB_NSS="libnss3.so"
readonly LIB_TOKN="libsoftokn3.so"

#Nombre de los plugins
readonly PLUGIN_FLASH="plugin.load_flash_only"
readonly PLUGIN_RSA_128="security.ssl3.dhe_rsa_aes_128_sha"
readonly PLUGIN_RSA_256="security.ssl3.dhe_rsa_aes_256_sha"

#Nombre del usuario a trabajar
USUARIO=""

#Para generar las pantallas y borrar el archivo temporal donde se guardan las acciones del usuario
DIALOG=${DIALOG=dialog}
tempfile=$(tempfile 2> /dev/null) || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
#################################################

#################################################
## FUNCIONES AUXILIARES
#################################################
# Funcion para tomar perfil
function get_perfil() {
  PERFIL=$(cat /home/$USUARIO/.mozilla/firefox/profiles.ini | grep Path | cut -d"=" -f2)
  get_ruta
}

# Funcion para tomar la ruta completa hasta el perfil
function get_ruta() {
  RUTA=/home/$USUARIO/$RUTA_FIREFOX/$PERFIL
}

# Funcion para agregar el usuario para trabajar
function set_nombre() {
  $DIALOG --clear --title "Ingresar usuario" --inputbox "Ingrese el nombre de usuario para trabajar en su perfil" 0 0 2> $tempfile
  if [ $? -ne 0 ]; then
    exit 1
  fi
  USUARIO=$(cat $tempfile)
  if [ -z $USUARIO ]; then
    echo "El usuario no puede estar vacio"
    exit 1
  fi
  get_perfil
}

# Funcion para el menu
function menuPrincipal() {
   # Si el usuario esta vacio le da el nombre
  if [ -z $USUARIO ]; then
    set_nombre
  fi

  $DIALOG --clear --title "Solucion a errores de APIA" --menu "Elige una opcion:" 0 0 0 \
    1 "Agregar plugin java" \
    2 "Desactivar seguridad ssl3" \
    3 "Copiar libreriras" \
    4 "Crear enlaces db" \
    5 "Agregar marcadores" \
    6 "Agregar los mimeTypes" \
    7 "Eliminar perfil de Firefox" \
    8 "Salir" \
    2> $tempfile

  salida_menu_ppal=$?
  choice=$(cat $tempfile)

  if [ $salida_menu_ppal -eq 0 ]; then
    manejo_opciones
  else
    exit 0
  fi
}

# Funcion para el manejo de las opciones
function manejo_opciones() {
  case $choice in
    1)
      agregar_plugin;;
    2)
      desactivar_ssl3;; 
    3)
      copiar_libreriras;; 
    4)
      crear_enlaces;; 
    5)
      agregar_marcadores;;
    6)
      agregar_mimeTypes;;
    7)
      eliminar_perfil;;
    8)
      salir;; 
  esac
}

# Funcion para devolver el archivo o directorio al dueño
function es_tuyo() {
  la_ruta=$1
  el_duenio=$(ls -l $la_ruta | cut -d " " -f 3)
  if [[ $el_duenio != $USUARIO ]]; then
    if [ -f $la_ruta ]; then
      chown $USUARIO: $la_ruta
    fi
    if [ -d $la_ruta ]; then 
      chown -R $USUARIO: $la_ruta
    fi
  fi
}
#################################################

#################################################
## FUNCIONES DEL MENU
#################################################
#OPCION - AGREGAR PLUGIN DE FLASH - funciona
function agregar_plugin() {
  if grep $PLUGIN_FLASH $RUTA/prefs.js; then
    $DIALOG --clear --title "Agregar plugin Java" --msgbox "El plugin para Java ya estaba agregado en Mozilla Firefox." 0 0
  else
    echo 'user_pref("$PLUGIN_FLASH", false);' >> $RUTA/prefs.js
    # plugin.load_flash_only
    es_tuyo $RUTA/prefs.js
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Agregar plugin Java" --msgbox "El plugin para Java fue agregado con exito en Mozilla Firefox." 0 0
    else
      $DIALOG --clear --title "Agregar plugin Java" --msgbox "No se pudo agregar el plugin para Java en Mozilla Firefox." 0 0
    fi
  fi
}

#OPCION - MODIFICAR PLUGINS SSL3 - funciona
function desactivar_ssl3() {
  if grep $PLUGIN_RSA_128 $RUTA/prefs.js; then
    $DIALOG --clear --title "Desactivar $PLUGIN_RSA_128" --msgbox "Ya estaba desactivo la seguridad SSL3 en Mozilla Firefox." 0 0
  else
    echo 'user_pref("$PLUGIN_RSA_128", false);' >> $RUTA/prefs.js
    # security.ssl3.dhe_rsa_aes_128_sha
    es_tuyo $RUTA/prefs.js
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Desactivar $PLUGIN_RSA_128" --msgbox "Se desactivo la seguridad SSL3 con exito en Mozilla Firefox." 0 0
    else
      $DIALOG --clear --title "Desactivar $PLUGIN_RSA_128" --msgbox "No se pudo desactivar la seguridad SSL3 en Mozilla Firefox." 0 0
    fi
  fi

  if grep $PLUGIN_RSA_256 $RUTA/prefs.js; then
    $DIALOG --clear --title "Desactivar $PLUGIN_RSA_256" --msgbox "Ya estaba desactivo la seguridad SSL3 en Mozilla Firefox." 0 0
  else
    echo 'user_pref("$PLUGIN_RSA_256", false);' >> $RUTA/prefs.js
    # security.ssl3.dhe_rsa_aes_256_sha
    es_tuyo $RUTA/prefs.js
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Desactivar $PLUGIN_RSA_256" --msgbox "Ya estaba desactivo la seguridad SSL3 en Mozilla Firefox." 0 0
    else
      $DIALOG --clear --title "Desactivar $PLUGIN_RSA_256" --msgbox "No se pudo desactivar la seguridad SSL3 en Mozilla Firefox." 0 0
    fi
  fi
}

#OPCION - COPIAR LAS LIBRERIAS - funciona
function copiar_libreriras() {
  if [ -d /usr/lib/firefox ]; then
    if [ -e /usr/lib/firefox/$LIB_NSS ]; then
      $DIALOG --clear --title "Copiar librerias" --msgbox "La librerira $LIB_NSS ya existe." 0 0
    else 
      cp /usr/firefox/$LIB_NSS /usr/lib/firefox/$LIB_NSS
      if [ $? -eq 0 ]; then
        $DIALOG --clear --title "Copiar librerias" --msgbox "Se copio la libreria $LIB_NSS con exito." 0 0
      else
        $DIALOG --clear --title "Copiar librerias" --msgbox "No se pudo copiar la libreria $LIB_NSS." 0 0
      fi
    fi

    if [ -e /usr/lib/firefox/$LIB_TOKN ]; then
      $DIALOG --clear --title "Copiar librerias" --msgbox "La librerira $LIB_TOKN ya existe." 0 0
    else
      cp /usr/firefox/$LIB_TOKN /usr/lib/firefox/$LIB_TOKN
      if [ $? -eq 0 ]; then
        $DIALOG --clear --title "Copiar librerias" --msgbox "Se copio la libreria $LIB_TOKN con exito." 0 0
      else
        $DIALOG --clear --title "Copiar librerias" --msgbox "No se pudo copiar la libreria $LIB_TOKN." 0 0
      fi
    fi
  else
    mkdir -p /usr/lib/firefox
    cp /usr/firefox/$LIB_NSS /usr/lib/firefox/$LIB_NSS
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Copiar librerias" --msgbox "Se copio la libreria $LIB_NSS con exito." 0 0
    else
      $DIALOG --clear --title "Copiar librerias" --msgbox "No se pudo copiar la libreria $LIB_NSS." 0 0
    fi
    cp /usr/firefox/$LIB_TOKN /usr/lib/firefox/$LIB_TOKN
    if [ $? -eq 0 ]; then
      $DIALOG --clear --title "Copiar librerias" --msgbox "Se copio la libreria $LIB_TOKN con exito." 0 0
    else
      $DIALOG --clear --title "Copiar librerias" --msgbox "No se pudo copiar la libreria $LIB_TOKN." 0 0
    fi
  fi
}

#OPCION - CREAR LOS ENLACES BD - funciona
function crear_enlaces() {
  ls /home/$USUARIO/$RUTA_FIREFOX/*.db 2> /dev/null
  if [ $? -eq 0 ]; then
    rm /home/$USUARIO/$RUTA_FIREFOX/*.db
  fi
  ln -s $RUTA/cert8.db /home/$USUARIO/$RUTA_FIREFOX/cert8.db
  ln -s $RUTA/key3.db /home/$USUARIO/$RUTA_FIREFOX/key3.db
  ln -s $RUTA/secmod.db /home/$USUARIO/$RUTA_FIREFOX/secmod.db
  if [ $? -eq 0 ]; then
    $DIALOG --clear --title "Crear enlaces" --msgbox "Se crearon los enlaces con exito en Mozilla Firefox." 0 0
  else
    $DIALOG --clear --title "Crear enlaces" --msgbox "No se pudieron crear los enlaces en Mozilla Firefox." 0 0
  fi
}

#OPCION - AGREGAR LOS MARCADORES
function agregar_marcadores() {
  cp -f ./places.sqlite /home/$RUTA
  es_tuyo /home/$RUTA/places.sqlite
  if [ $? -eq 0 ]; then
    $DIALOG --clear --title "Copiar marcadores" --msgbox "Se copiaron los marcadores con exito en Mozilla Firefox." 0 0
  else
    $DIALOG --clear --title "Copiar marcadores" --msgbox "No se pudieron copiar los marcadores en Mozilla Firefox." 0 0
  fi
}

#OPCION - AGREGAR LOS MIMETYPES
function agregar_mimeTypes() {
  cp -f ./mimeTypes.rdf /home/$RUTA
  es_tuyo /home/$RUTA/mimeTypes.rdf
  if [ $? -eq 0 ]; then
    $DIALOG --clear --title "Copiar el archivo mimeTypes" --msgbox "Se copio el archivo del mimeTypes con exito en Mozilla Firefox." 0 0
  else
    $DIALOG --clear --title "Copiar el archivo mimeTypes" --msgbox "No se pudo copiar el archivo del mimeTypes en Mozilla Firefox." 0 0
  fi
}

#OPCION - ELIMINAR PERFIL DE FIREFOX - funciona
function eliminar_perfil() {
  local exito=1
  local NUEVO_PERFIL=""
  if [ -d /home/$USUARIO/$RUTA_FIREFOX ]; then
    cp perfil.tar /home/$USUARIO/$RUTA_FIREFOX
    cd /home/$USUARIO/$RUTA_FIREFOX
    #crear respaldos y eliminar los perfiles
    mkdir respaldo-perfil
    mv $PERFIL respaldo-perfil/
    mv profiles.ini respaldo-perfil/
    tar xfv perfil.tar
    rm perfil.tar
    #captura el nombre del nuevo perfil
    NUEVO_PERFIL=$(cat /home/$USUARIO/$RUTA_FIREFOX/profiles.ini | grep -i path | cut -d "=" -f 2)
    #agrega la barra de marcadores
    cp -f respaldo-perfil/$PERFIL/xulstore.json $NUEVO_PERFIL/
    #agregar los certificados
    cp -f respaldo-perfil/$PERFIL/cert8.db $NUEVO_PERFIL/
    #agregar los certificados
    cp -f respaldo-perfil/$PERFIL/key3.db $NUEVO_PERFIL/
    #cambia el dueño de todo
    es_tuyo $NUEVO_PERFIL
    #chown -R $USUARIO: $NUEVO_PERFIL
    es_tuyo profiles.ini
    #Vuelve al directorio anterior
    cd -
    PERFIL=$NUEVO_PERFIL  
    crear_enlaces
  else
    exito=0
  fi

  if [ $exito -eq 1 ]; then
    $DIALOG --clear --title "Eliminar perfil" --msgbox "Se elimino y creo el nuevo perfil de $USUARIO con exito en Mozilla Firefox." 0 0
  else
    $DIALOG --clear --title "Eliminar perfil" --msgbox "No se pudo eliminar o crear el nuevo perfil de $USUARIO en Mozilla Firefox." 0 0
  fi
}

#OPCION ControlPanel de java
# function java() {
#   JAVA_DIR=$(update-alternatives --get-selections | grep java | head -n1 | cut -d " " -f 31)

# }

#OPCION - SALIR - funciona
function salir() {
  exit 0
}
#################################################

#################################################
## PRINCIPAL
#################################################
while true; do
  menuPrincipal
done
#################################################
