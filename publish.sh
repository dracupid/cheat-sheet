#!/bin/bash

# ref: https://github.com/sotayamashita/awesome-css/blob/master/update

echo -e "\033[0;32mUpdating ...\033[0m"

git add -A

if [ $# -eq 1 ]
then msg="$1"
else
    msg="Update: $(date "+%Y-%m-%d %H:%M:%S")"
fi

echo "Commit Message: $msg"

git commit -m "$msg"
git push origin master
