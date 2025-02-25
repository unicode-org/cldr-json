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

if [[ -z "$VERSION" ]];
then
    echo "VERSION is undefined, exiting from $0"
    exit 1
fi

set -x
( cd ${OUT} && cp ../LICENSE LICENSE )
( cd ${OUT} && zip -x "*.DS_Store" -r cldr-${VERSION}-json-full.zip LICENSE cldr-core cldr-rbnf cldr-*-full cldr-bcp47 cldr-transforms )
#( cd ${OUT} && zip -r cldr-${VERSION}-json-modern.zip LICENSE cldr-core cldr-rbnf cldr-*-modern cldr-bcp47 cldr-transforms )
( cd ${OUT} && rm LICENSE )

mv -v ${OUT}/*.zip ${DIST}/
