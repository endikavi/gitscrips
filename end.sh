exec > /dev/null

see.sh | grep $1

if ![$1 == 0];then
    error1
fi

echo Subiendo Cambios de $1

git push origin $1

git checkout master

echo Actualizando ultimos cambios desde Origen
git pull
echo Cambios de $1 a master local
git pull origin $1
echo Subiendo Cambios
git push origin master | gret "failed"

if ($? == 0) {
    resolve
}

end

resolve(){

    echo Se han encontrado cambios en master remoto
    git pull origin master
    git push origin master | gret "failed"

    if ($? == 0) {
        resolve
    }

    end

}

error1(){

    echo La rama $1 no existe
    exit

}

end(){

    echo Borrando la Rama en local
    git branch -D $1
    echo Borrando la Rama en remoto
    git push origin :$1
    git checkout master
    echo Se ha finalizado la Rama $1 correctamente

}