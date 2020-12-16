#!/bin/bash
# 
#     Copyright © 1991-2020 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

CLDR_DIR=../cldr
OUT=./cldr-json
INDATA=../cldr-staging/production

# which types to generate
TYPES="supplemental segments rbnf main annotations"
DRAFTSTATUS="contributed"
VERSION="38.1.0-BETA3"

# for now, seed has to exist.
mkdir -p -v ${OUT} production/seed/main production/seed/annotations
MAIN_CLASS=org.unicode.cldr.json.Ldml2JsonConverter
export MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=1024m -Dexec.cleanupDaemonThreads=false -Dexec.mainClass=${MAIN_CLASS}"
MVN="mvn --file=${CLDR_DIR}/tools/pom.xml"
MVN_COMPILE="${MVN} compile"
MVN_EXEC="${MVN} -DCLDR_DIR=${INDATA} exec:java -pl cldr-code"

set -x
${MVN_COMPILE} || exit 1

for type in ${TYPES}; do
    ${MVN_EXEC}  -Dexec.args="-p true -o false -r true -t ${type} -d ${OUT} -s ${DRAFTSTATUS} -V ${VERSION}" || exit 1
done

## Example options for the generator:
#[-p, true, -o, false, -r, true, -t, supplemental, -d, ./cldr-json, -s, contributed]
#-c	commondir	≝	/Users/srl295/src/cldr-staging/production/common/
#-d	destdir	≔	./cldr-json
#-m	match	≝	.*
#-t	type	≔	supplemental
#-r	resolved	≔	true
#-s	draftstatus	≔	contributed
#-l	coverage	≝	optional
#-n	fullnumbers	≝	false
#-o	other	≔	false
#-p	packages	≔	true
#-i	identity	≝	true
