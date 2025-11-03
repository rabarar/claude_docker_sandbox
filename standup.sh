#!/bin/bash

CONTAINER_TEMPLATE='container_template_dir'
NEW_SB=${NEW_SB-"sandbox"}

if [ "${1}" != "" ];then
	NEW_SB=${1}
fi

if [ -f ${NEW_SB} ] ||  [ -d ${NEW_SB} ]; then
	echo "${NEW_SB} already exists, try again with a new name"
	exit 1
fi

echo "creating new work sandbox in ./${NEW_SB}"
cp -rp  ${CONTAINER_TEMPLATE} ${NEW_SB} && echo "copied template"
sed -i "" "s/{{name}}/${NEW_SB}/g" ${NEW_SB}/docker-compose.yml && echo "updated build.sh script"
echo "done!"

