#!/bin/bash
# 
#     Copyright © 1991-2020 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

CLDR_DIR=../cldr
OUT=./cldr-json
INDATA=../cldr-staging/production

mkdir -p -v ${OUT}
MAIN_CLASS=org.unicode.cldr.json.Ldml2JsonConverter
export MAVEN_OPTS="-Xmx8192m -XX:MaxPermSize=1024m -Dexec.cleanupDaemonThreads=false -Dexec.mainClass=${MAIN_CLASS}"
MVN="mvn --file=${CLDR_DIR}/tools/pom.xml"
MVN_COMPILE="${MVN} compile"
MVN_EXEC="${MVN} -DCLDR_DIR=${INDATA} exec:java -pl cldr-code"

set -x
${MVN_COMPILE} || exit 1

for type in supplemental segments rbnf main; do
    ${MVN_EXEC}  -Dexec.args="-p true -o false -r true -t ${type} -d ${OUT} -s contributed" || exit 1
done
