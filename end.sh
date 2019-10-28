see.sh | grep $1;

if [[ "$?" == 1 ]];then
    echo "There is not Branch named $1";
    exit
fi

echo "Uploading changes from $1 to origin";

git push origin $1;

git checkout master;

echo "Updating last master changes from origin";
git pull;
echo "Adding changes from origin $1 to local master"
git pull origin $1;
echo "Uploading local master to origin"
git push origin master | gret "failed";

if [[ "$?" == 1 ]];then
    resolve
fi

end

resolve(){

    echo "master is outdated, resolving...";
    git pull origin master;
    git push origin master | gret "failed";

    if [[ "$?" == 1 ]];then
        resolve
    fi

    end

}

end(){

    echo "Deleting local branch";
    git branch -D $1;
    echo "Deleting branch in origin";
    git push origin :$1;
    git checkout master
    echo "$1 Ended successfully";

}