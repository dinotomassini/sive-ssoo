#!/bin/bash

## SCRIPT PRINCIPAL QUE EJECUTA LOS DEMAS

crearUsuariosSistema

# Que opciones
opciones=("Suma" "Resta" "Multiplicacion" "Division" "Salir")
select opt in ${opciones[@]};
do
  case $opt in
    Suma)
      let res=$a+$b
      echo "Sumando... $a+$b=$res"
      ;;
    Resta)
      let res=$a-$b
      echo "Restando... $a-$b=$res"
      ;;
    Multiplicacion)
      echo "Multiplicando..."
      let res=$a*$b
      echo "Restando... $a*$b=$res"
      ;;
    Division)
      if [[ $b != 0 ]]; then
        let res=$a/$b
        echo "Dividiendo... $a/$b=$res"
      else
        echo "No puedo dividir entre 0"
      fi
      ;;
    Salir)
      echo "Saliendo..."
      break
      ;;
    *)
      echo "La opcion $REPLY no esta implementada, intenta con otra"
      ;;
  esac
done
