
#!/bin/bash

echo "Generating .env with param manpreet-env for service simple-react"

aws ssm get-parameters-by-path --path "/manpreet-env/simple-react/" --with-decryption   --region ap-south-1 --query="Parameters[*].[Name, Value]"   --output text |
 while read line
 do
    name=$(echo ${line}} | cut -f 1 -d ' ' | sed -e "s/\/manpreet-env\/simple-react\///g")
    value=$(echo ${line} | cut -f 2 -d ' ')
    echo "${name}=${value}" >> .env
 done
ls -lart
npm start
