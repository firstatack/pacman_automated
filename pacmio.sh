#!/bin/bash

# Verificar si se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

# Función para mostrar el menú
function mostrar_menu {
    echo "----- Menú de Opciones de Pacman -----"
    echo "1. Actualizar la base de datos de paquetes"
    echo "2. Instalar un paquete"
    echo "3. Desinstalar un paquete y sus configuraciones"
    echo "4. Buscar un paquete"
    echo "5. Mostrar información de un paquete"
    echo "6. Limpiar la caché de paquetes"
    echo "7. Actualizar los paquetes del sistema"
    echo "8. Salir"
    echo "---------------------------------------"
}

# Función para actualizar la base de datos de paquetes
function actualizar_base_de_datos {
    pacman -Sy
    echo "La base de datos de paquetes ha sido actualizada."
}

# Función para instalar un paquete
function instalar_paquete {
    read -p "Ingrese el nombre del paquete a instalar: " paquete
    pacman -S $paquete
    echo "El paquete $paquete ha sido instalado."
}

# Función para desinstalar un paquete y sus configuraciones
function desinstalar_paquete {
    read -p "Ingrese el nombre del paquete a desinstalar: " paquete
    pacman -Rns $paquete
    echo "El paquete $paquete y sus configuraciones han sido desinstalados."
}

# Función para buscar un paquete
function buscar_paquete {
    read -p "Ingrese el nombre del paquete a buscar: " paquete
    pacman -Ss $paquete
}

# Función para mostrar información de un paquete
function mostrar_informacion_paquete {
    read -p "Ingrese el nombre del paquete: " paquete
    pacman -Qi $paquete
}

# Función para limpiar la caché de paquetes
function limpiar_cache {
    pacman -Sc
    echo "La caché de paquetes ha sido limpiada."
}

# Función para actualizar los paquetes del sistema
function actualizar_paquetes {
    pacman -Syu
    echo "Los paquetes del sistema han sido actualizados."
}

# Mostrar el menú y leer la opción seleccionada
mostrar_menu
read -p "Seleccione una opción: " opcion

# Ejecutar la opción seleccionada
case $opcion in
    1) actualizar_base_de_datos ;;
    2) instalar_paquete ;;
    3) desinstalar_paquete ;;
    4) buscar_paquete ;;
    5) mostrar_informacion_paquete ;;
    6) limpiar_cache ;;
    7) actualizar_paquetes ;;
    8) echo "Saliendo..." ;;
    *) echo "Opción inválida. Saliendo..." ;;
esac
