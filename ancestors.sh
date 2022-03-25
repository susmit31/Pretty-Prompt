if [ $(pwd) == $HOME ] 
then
	echo "~"
elif [ $(pwd) == / ]
then
	echo "/"
else
	anc=$(echo $(dirname $(pwd)) | sed "s|$HOME|~|")
	echo $anc;
fi
