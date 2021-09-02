#!/bin/bash
#
#     Copyright © 1991-2020 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

. ./cldr-config.sh
if [ -x ./local-config.sh ];
then
    echo "Using local-config.sh"
    . ./local-config.sh
fi

# for now, seed has to exist.
mkdir -p -v ${OUT} ${INDATA}/seed/main ${INDATA}/seed/annotations ${DIST}
MAIN_CLASS=org.unicode.cldr.json.Ldml2JsonConverter
export MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=1024m -Dexec.cleanupDaemonThreads=false -Dexec.mainClass=${MAIN_CLASS}"
MVN="mvn --file=${CLDR_DIR}/tools/pom.xml -pl cldr-code"
MVN_COMPILE="${MVN} compile"
MVN_EXEC="${MVN} -DCLDR_DIR=${INDATA} exec:java"

set -x
${MVN_COMPILE} || exit 1

for type in ${TYPES}; do
    ${MVN_EXEC}  -Dexec.args="-m ${MATCH} -p true -o true -r true -t ${type} -d ${OUT} -s ${DRAFTSTATUS} -V ${VERSION}" || exit 1
done

echo "Finshed converting '${TYPES}' to ${OUT}"

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
