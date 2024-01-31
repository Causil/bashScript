#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Verifica la existencia de pip3 y python3 en el sistema
echo "---Verificando que esté instalado python3 y pip3---"
echo ">>> which pip3 & which python3"
which pip3
which python3

# Instala python3-venv si no está instalado
name_programa="python3-venv"
echo "---Validando--python3-venv---"
if dpkg -s $name_programa >/dev/null 2>&1; then
    echo "El programa $name_programa ya está instalado en este computador."

else
    echo "El programa $name_programa no está instalado. Instalando..."
    echo ">>> apt-get install -y $name_programa "
    sudo apt-get install -y $name_programa 
fi
echo "---Finalizando la validación---"
# Crea el entorno virtual
echo "----------------------------------------"
echo "---Creando entorno virtual en el directorio $1---"
echo "--------------------------------------------"
echo "-->>> python3 -m venv $1--"
python3 -m venv $1
echo "--Verificando si el entorno virtual se instalo--"
# Verifica si el entorno virtual se creó correctamente
if [ -d "$1" ]; then
    echo "--Entorno virtual creado correctamente en el directorio $1--"
else
    echo "--Error al crear el entorno virtual en $1--"
    exit 1
fi

# Activa el entorno virtual
echo "--------------------------------------------"
echo "---Activando el entorno virtual---"
echo "--------------------------------------------"
echo "--Ingresando al directorio del entorno virtual cd $1--"
cd $1
echo ">>> source bin/activate"
source bin/activate
echo "--Validando activación del entorno virtual--"
if [ -n "$VIRTUAL_ENV" ]; then
    echo "Entorno virtual activado: $VIRTUAL_ENV"
else
    echo "--No hay entorno virtual activado.--"
    exit
fi
echo " "
conditionDependencias=0

while [ $conditionDependencias -eq 0 ]; do
    echo "¿Quieres instalar algunas dependencias?"
    read -p "responde y = si o n = no " respuesta

    if [ "$respuesta" == "y" ]; then
        read -p "Ingresa el nombre de las dependencias separadas por un espacio: " dependencias
        echo ">>> pip3 install $dependencias"
        pip3 install $dependencias
        echo "--Generando archivo requeriments-- "
        pip3 freeze > requeriments.txt
    else
        echo "--"
        conditionDependencias=1
        echo "--Hasta luego--"
        echo "--"
    fi
done




# Puedes añadir más pasos aquí, por ejemplo, instalar dependencias del proyecto

# Finaliza el script
#exit

