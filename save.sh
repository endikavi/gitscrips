exec > /dev/null 2>&1
echo Guardando cambios
git add *
git status
git commit -m $1
echo Subiendo Cambios
git push origin HEAD | grep "failed"

if ($? == 0){
    resolve
}

echo Subida Correcta

resolve(){

    echo Se han encontrado cambios en remoto

    git pull
    git push origin HEAD | findstr /C:"failed"

    if( $? == 0 ){resolve}

}