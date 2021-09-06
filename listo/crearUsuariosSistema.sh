#! /bin/bash

## SCRIPT PARA LA CREACION DE USUARIOS EN EL SISTEMA OPERATIVO
usuarios=("admin" "dba" "app" "respaldo")

echo "Creando los usuarios del sistema operativo"

for usuario in ${usuarios[@]};
do
  echo "Creando $usuario..."

  sudo useradd -m -p $usuario-sive.21 $usuario
  
  if [ $? -eq 0 ]; then
    echo "Creado el usuario $usuario"
  else
    echo "Ocurrio un error al crear el usuario $usuario"
    exit
  fi
done

echo "Todos los usuarios creados"
