#!/bin/bash

## SCRIPT PARA LA CREACION DE LA BASE DE DATOS
echo "Creando la base de datos bd_sive"

mysql -u root -p < createDB.sql

if [ $? -eq 0 ]; then
    echo "Creada la base de datos"
  else
    echo "Ocurrio un error al crear la base de datos"
    exit
  fi

echo "Toda la base de datos y sus tablas creadas"
