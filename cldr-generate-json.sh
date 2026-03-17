#!/bin/bash
#
#     Copyright © 1991-2023 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

set -e

. ./cldr-config.sh
if [ -x ./local-config.sh ];
then
    echo "Using local-config.sh"
    . ./local-config.sh
fi

if [[ -z "$VERSION" ]];
then
    echo "VERSION is undefined, exiting from $0"
    exit 1
fi

export MAVEN_OPTS="-Xmx16384m -Dexec.cleanupDaemonThreads=false"
MVN="mvn ${MVN_OPTS} --file=${CLDR_DIR}/tools/pom.xml -pl cldr-code"

set -x
${MVN} compile

if [[ "$INDATA" == "generate" ]];
then
    export INDATA="target/data"
    mkdir -p "${INDATA}"
    ${MVN} exec:java -Dexec.mainClass=org.unicode.cldr.tool.GenerateProductionData -DCLDR_DIR=${CLDR_DIR} -Dexec.args="-d ${INDATA}/common"
fi

mkdir -p ${OUT}
# for now, seed has to exist.
mkdir -p -v ${INDATA}/seed/{main,annotations}

for type in ${TYPES}; do
    ${MVN} exec:java -Dexec.mainClass=org.unicode.cldr.json.Ldml2JsonConverter -DCLDR_DIR=${INDATA} -Dexec.args="-m ${MATCH} -p true -o true -r true -t ${type} -d ${OUT} -s ${DRAFTSTATUS} -V ${VERSION} ${EXTRA_JSON_OPTS}"
done

echo "Finshed converting '${TYPES}' to ${OUT}"

if [[ "$INDATA" == "target/data" ]];
then
    rm -r "$INDATA"
fi

if [ -x ./local-config.sh ];
then
    echo "REMINDER: you have a local-config.sh - may not be a standard build"
fi

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
