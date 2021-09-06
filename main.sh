#!/bin/bash

## SCRIPT PRINCIPAL QUE EJECUTA LOS DEMAS

opciones=("Crear_usuarios" "Respaldar_la_base_de_datos" "Recuperar_la_base_de_datos" "Salir")
select opt in ${opciones[@]};
do
  case $opt in
    Crear_usuarios)
      echo "Creando usuarios"
      ./crearUsuariosSistema.sh
      ./crearUsuariosDB.sh
      ./crearBD.sh
      ;;
    Respaldar_la_base_de_datos)
      echo "Respaldando la base de datos"
      ./crearRespaldo.sh
      ;;
    Recuperar_la_base_de_datos)
      echo "Recuperando la base de datos"
      ./recuperarRespaldo.sh
      ;;
    Salir)
      echo "Saliendo"
      break
      ;;
    *)
      echo "La opcion $REPLY no esta implementada, intenta con otra"
      ;;
  esac
done
