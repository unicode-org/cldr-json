#!/bin/bash
# 
#     Copyright © 1991-2023 Unicode, Inc. All rights reserved. Distributed under
# the Terms of Use in http://www.unicode.org/copyright.html.
#
# Creates JSON data under ./cldr-json in this directory.

. ./cldr-config.sh
if [ -x ./local-config.sh ];
then
    echo "Using local-config.sh"
    . ./local-config.sh
fi

VERSION="$(jq -r .version cldr-json/cldr-core/package.json)"
DIST=$(pwd)/${DIST}

set -x
mkdir -p ${DIST}
cp LICENSE ${OUT}/LICENSE
( cd ${OUT} && zip -x "*/.DS_Store" -r ${DIST}/cldr-${VERSION}-json-full.zip * )
rm ${OUT}/LICENSE
