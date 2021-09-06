#!/bin/bash

respaldo="BackUp_SIVE-06-09-2021_14-52-28.sql"

## SCRIPT PARA LA CREACION DEL RESPALDO DE LA BASE DE DATOS
echo "Recuperando el respaldo de la base de datos"

mysql -u respaldo -prespaldo-sive.21 < $respaldo

if [ $? -eq 0 ]; then
    echo "Recuperado el respaldo de la base de datos"
  else
    echo "Ocurrio un error durante la recuperacion de la base de datos"
    exit
  fi

echo "Recuperacion terminado con exito"
