see.sh | grep $1;

if [[ "$?" == 1 ]];then
    echo La rama $1 no existe
    exit
fi

echo La rama $1 existe

echo Subiendo Cambios de $1

git push origin $1;

git checkout master;

echo Actualizando ultimos cambios desde Origen
git pull;
echo Cambios de $1 a master local
git pull origin $1;
echo Subiendo Cambios
git push origin master | gret "failed";

if [[ "$?" == 1 ]];then
    resolve
fi

end

resolve(){

    echo Se han encontrado cambios en master remoto
    git pull origin master;
    git push origin master | gret "failed";

    if [[ "$?" == 1 ]];then
    resolve
    fi

    end

}

end(){

    echo Borrando la Rama en local
    git branch -D $1;
    echo Borrando la Rama en remoto
    git push origin :$1;
    git checkout master
    echo Se ha finalizado la Rama $1 correctamente;

}