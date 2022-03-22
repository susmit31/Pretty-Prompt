if [ "$(pwd)" == "/home/$USER" ] 
then
	echo "";
else
	echo $(dirname $(pwd));
fi