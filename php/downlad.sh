#!/bin/bash
#author: Daniel Hernandez
#MIT License
#Downloads every package version until found the last version with the method definition
#I create this script to solve the problem in https://stackoverflow.com/questions/61034281/php-extension-stats


phpPackage="stats" && urlP="https://pecl.php.net/package/$phpPackage"                                                                                                                                             
fileName="$phpPackage.html"

if [[ ! -f "$fileName" ]]; then 
    wget $urlP -O "$fileName"
fi

#cat $fileName | grep .gz | sed 's/.*href=\"//g'| sed 's/$/tgz/' | awk -v url="$urlP" '{print url $0}'


versions=$(cat $fileName | grep -E "*.tgz*" | grep -v img |  sed 's/.*href=\"//g'| sed 's/tgz.*/tgz/' | awk -v url="$urlP" '{print url $0}')

for i in $versions; do
    echo "procesing"
    fileVersion=$(echo $i | sed 's/\(*.\)\\/1 /')
    echo $fileVersion
    if [[ ! -f $fileVersion  ]]; then 
        #wget $i
        echo $fileVersion

    fi
    exit
    tar -xvf $fileVersion

    grep -nri  stats_rand_gen_ib

done

