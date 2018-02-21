#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -f $0))

GRADLE=${SCRIPT_DIR}/../gradlew

echo GRADLE = $GRADLE
