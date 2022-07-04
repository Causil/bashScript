#gnome-terminal -- bash -c "prueba.sh; exec bash"
#gnome-terminal -x bash -c "bash prueba.sh; exec bash"
for program in $@
do
gnome-terminal -x bash  -c "$program; exec bash"
done