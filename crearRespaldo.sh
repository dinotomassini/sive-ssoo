#!/bin/bash

## SCRIPT PARA LA CREACION DEL RESPALDO DE LA BASE DE DATOS
echo "Creando el respaldo de la base de datos"

# mysqldump -h  -u root -p --all-databases --add-drop-databases --add-drop-tables --ssl --dump-date > BackUp_All-$(date %d-%m-%G_%H-%M-%S).sql
mysqldump -h localhost -u respaldo -prespaldo-sive.21 --ssl --dump-date bd_sive > BackUp_SIVE-$(date +%d-%m-%G_%H-%M-%S).sql

if [ $? -eq 0 ]; then
    echo "Creado el respaldo de la base de datos"
  else
    echo "Ocurrio un error durante el respaldo de la base de datos"
    exit
  fi

echo "Respaldo terminado con exito"
