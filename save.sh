echo "Guardando cambios"
git add *;
git status;
git commit -m $1;
echo "Subiendo Cambios"
git push origin HEAD | grep "failed";

resolve(){

    echo "Se han encontrado cambios en remoto"

    git pull;
    git push origin HEAD | findstr /C:"failed";

    if [[ "$?" == 1 ]];then
        resolve
    fi

}

if [[ "$?" == 1 ]];then
    resolve
fi

echo "Subida Correcta"