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

if command -v jq 2>/dev/null >/dev/null;
then
    OLDVERSION="${VERSION}"
    # Use jq to determine the actual version of from cldr-core
    VERSION=$(cat cldr-json/cldr-core/package.json | jq -r .version)
    if [[ "${OLDVERSION}" != "${VERSION}" ]];
    then
	echo "warning: Using version ${VERSION} for the package, but the config files have ${OLDVERSION}"
    fi
else
    # we can't verify the version, but try to package anyway
    echo "Warning: Using version ${VERSION} for the package, could not determine actual version"
fi

if [[ -z "$VERSION" ]];
then
    echo "VERSION is undefined, exiting from $0"
    exit 1
fi

echo "VERSION=${VERSION}"
FULL_ZIP=cldr-${VERSION}-json-full.zip
EXCLUDE="*/.DS_Store"

set -x
# temporarily copy the license file over
( cd ${OUT} && cp ../LICENSE LICENSE )
( cd ${OUT} && zip -x "${EXCLUDE}" -r "${FULL_ZIP}" LICENSE cldr-core cldr-rbnf cldr-*-full cldr-bcp47 cldr-transforms )
#( cd ${OUT} && zip -r cldr-${VERSION}-json-modern.zip LICENSE cldr-core cldr-rbnf cldr-*-modern cldr-bcp47 cldr-transforms )
# clean up the license file
( cd ${OUT} && rm LICENSE )

mv -v ${OUT}/*.zip ${DIST}/
