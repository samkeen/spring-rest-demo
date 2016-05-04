#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USAGE="Usage: ${0} <path to jar>"

if [[ $# -ne 1 ]]; then
    echo ${USAGE}
    exit 1
fi

PATH_TO_JAR=$1

if [[ ! -f ${PATH_TO_JAR} ]]; then
    echo "jar file not found at: ${PATH_TO_JAR}"
    echo ${USAGE}
    exit 1
fi

${DIR}/run-server.sh $1 development
