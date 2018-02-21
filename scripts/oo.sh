#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $(readlink -f "$0"))

if [ "update" = "$1" ] ; then

  if [ "skip-git-pull" = "$2" ] ; then
    echo skip git pull
  else
    cd ${SCRIPT_DIR}/..
    git pull
  fi

  GRADLE=$(realpath ${SCRIPT_DIR}/../gradlew)

  cd ${SCRIPT_DIR}/../cmd
  rm -rf build

  ${GRADLE} cmdFileCreator

  exit 0
fi

RUN_CMD=${SCRIPT_DIR}/../cmd/build/cmd/run.cmd.txt

exec $(cat ${RUN_CMD}) "$@"
