#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

if [ -z ${JAVA_XMS+x} ]; then
	JAVA_XMS="256M"
fi
if [ -z ${JAVA_XMX+x} ]; then
	JAVA_XMX="1024M"
fi
if [ -z ${PORT+x} ]; then
	PORT="5000"
fi

java \
	-Dfile.encoding="utf-8" \
	-Dwarbler.port=$PORT \
	-Xms${JAVA_XMS} \
	-Xmx${JAVA_XMX} \
	-jar "/app/tabula.jar"
