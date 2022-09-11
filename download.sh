#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
cd /app/

echo "-----> Scraping JAR URL"
URL=https://github.com$(wget -q -O - "https://github.com/tabulapdf/tabula/releases/tag/${GIT_TAG}" \
	| egrep --color=no '<a href="/tabulapdf/tabula/releases/download/.*/tabula-jar-.*.zip"' \
	| head -1 \
	| sed 's/.*href="//; s/".*//'
)
DOWNLOAD_FILENAME="tabula.zip"

echo "-----> Downloading ${URL}"
wget -q -O "$DOWNLOAD_FILENAME" "$URL"

echo "-----> Unpacking"
unzip -q "$DOWNLOAD_FILENAME"
mv tabula/tabula.jar tabula.jar
rm -rf "$DOWNLOAD_FILENAME" "tabula"
