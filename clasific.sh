#El siguiente código clasifica archivos de una carpeta llamada taller

for directory in $@
do 
if [ -d $directory ]; then
  echo 'Las carpetas ya estan creadas'
  echo 'Eliminelas y descomprima el archivo y vuelva a ejecutar el archivo.sh'
  exit
else
  mkdir $directory
fi
done
allDir=`ls taller`
for item in $allDir; do
    if [ ! $item == 'passwd' ]; then
      allFile=`ls taller/$item`
      for file in $allFile ;do
          ext=`ls taller/$item/$file | rev | cut -d '.' -f 1 | rev`
          #file_name=`ls taller/$item/$file | rev | cut -d '.' -f 2 | rev`
          if [[ $ext == "csv" || $ext == "doc" ]] ;then 
              mv "taller/$item/$file" "Documents"
          fi
          if [[ $ext == "mp3" ]] ;then 
              mv "taller/$item/$file" "Music"
          fi
          if [[ $ext == "png" || $ext == "jpeg" ]] ;then 
              mv "taller/$item/$file" "Pictures"
          fi
      done
    fi
done    