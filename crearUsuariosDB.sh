#!/bin/bash

## SCRIPT PARA LA CREACION DE USUARIOS EN LA BASE DE DATOS
echo "Creando los usuarios de la base de datos y configurando los permisos"

mysql -u root -ptoor < createUsersDB.sql
mysql -u root -ptoor < asignarRolesDB.sql

if [ $? -eq 0 ]; then
  echo "Creados los usuarios para la base de datos"
else
  echo "Ocurrio un error al crear los usuarios de la base de datos"
  exit
fi

echo "Todos los usuarios creados"
