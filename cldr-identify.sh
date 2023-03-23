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

function explain_repo()
{
    git rev-parse --short  HEAD
    git describe --tags HEAD
}

echo "* cldr-json info"
echo "- DATA: unicode-org/cldr-staging: " $(cd ${INDATA}; explain_repo)
echo "- TOOL: unicode-org/cldr: " $(cd ${CLDR_DIR}; explain_repo)
echo "- SCRIPT: unicode-org/cldr-json: " $(explain_repo)

