printf "What's the directory where are you going to create your Dockered application? [C]=>For cancel the command"
echo
#change the directory on whatever you want to create the new project
DIR="/home/casfid/Documentos/Proyectos"
# Ininicialize a while waiting the exit in the script
while true ; do
    read answer
    # exit the program if the answer is C
    if [ $answer = "C" ] ; then
        exit
    fi
    newdirname="$DIR/$answer"
    # test the existance of the new directory
    if [ -d "$newdirname" ] ; then
        echo "The directory is already created try an other name or cancel with[C]"
    else
        `mkdir -p $newdirname`
        `cp -R /home/casfid/Documentos/Proyectos/DockerAMPP/. $newdirname`
        echo "$answer was created, now enter the git link or leave it empty"
        read gitDirectory
        if [ "$gitDirectory" ] ; then
            `git -C $newdirname/www clone $gitDirectory .`
            echo "your enviroment is ready to be seted"
            echo "You can change the docker php and mysql version from the enviroment file"
            echo "Enjoy it ;)"
        fi
        exit
    fi
done
