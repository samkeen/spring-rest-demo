#!/usr/bin/env bash

USAGE="Usage: ${0} <path to jar> <optional environment ['development'|'production'] defaults to production>"

if [[ $# -lt 1 ]]; then
    echo ${USAGE}
    exit 1
fi

PATH_TO_JAR=$1

if [[ ! -f ${PATH_TO_JAR} ]]; then
    echo "jar file not found at: ${PATH_TO_JAR}"
    echo ${USAGE}
    exit 1
fi

if [[ $# -gt 1 ]]; then
    echo "using environment from commandline arg: '${2}'"
    ENV=${2}
else
    echo "Environment name commandline arg not seen ['development'|'production'], using 'production'"
    ENV=production
fi

if [[ ${ENV} != production && ${ENV} != development ]];then
    echo "'${ENV}' is not one of the valid environments: [production|development]"
    echo ${USAGE}
    exit 1
fi

echo "executing: java -jar ${PATH_TO_JAR} --spring.profiles.active=${ENV}"
java -jar ${PATH_TO_JAR} \
    --spring.profiles.active=${ENV}
