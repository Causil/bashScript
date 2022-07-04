#El siguiente código clasifica archivos de una carpeta llamada taller

for dir in $@
do 
if [ -d $dir ]; then
  echo 'Las carpetas ya estan creadas'
  echo 'Eliminelas y descomprima el archivo y vuelva a ejecutar el archivo.sh'
  exit
else
  mkdir $dir
fi
done
allFile=`ls taller`
for item in $allFile; do
    if [ ! $item == 'passwd' ]; then
      allFileItem=`ls taller/$item`
      for file in $allFileItem ;do
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