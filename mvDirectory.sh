#Pase por argumento dos rutas
#La primera ruta es la carpeta que tiene la información
#La segunda ruta es la carpeta donde se depositan los archivos
#echo $1
#echo $2
allFile=`ls $1`
for file in $allFile; do
   mv "$1/$file" "$2"
done
