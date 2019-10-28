echo "Saving changes..."
git add *;
git status;
git commit -m $1;
echo "Uploading changes to origin"
git push origin HEAD | grep "failed";

resolve(){

    echo "local branch is outdated, resolving..."

    git pull;
    git push origin HEAD | findstr /C:"failed";

    if [[ "$?" == 1 ]];then
        resolve
    fi

}

if [[ "$?" == 1 ]];then
    resolve
fi

echo "Success"