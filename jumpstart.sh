#!/bin/bash
repositoryName=$1
gh repo create $repositoryName --template "https://github.com/Th3Nathan/template-node" --public

while [ ! -f $repositoryName/package.json ]
do
  rm -rf $repositoryName
  sleep 0.1
  gh repo clone github.com/Th3Nathan/$repositoryName
done

cd $repositoryName
sed -i '' -e "s/\"name\": \"template\"/\"name\": \"$repositoryName\"/g" "package.json"
npm i
git add .
git commit -m "chore: change 'template' to '$repositoryName' in package json"
git push
echo "finished setting up the repo: $repositoryName"
code .
