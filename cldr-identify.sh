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
    # set 'UPSTREAM_CLDR_JSON=upstream' etc. in local-config.sh to rename the remote
    UPSTREAM_VAR=$(echo upstream-$1 | tr a-z- A-Z_)
    UPSTREAM=${!UPSTREAM_VAR:-origin}
    git remote get-url ${UPSTREAM} | sed -E 's/git@github.com:|https:\/\/github.com\/|.git//g'
    git describe --tags HEAD
}

echo "* cldr-json info"
if [[ "$INDATA" == "generate" ]]
then
    echo "- DATA: " $(cd ${CLDR_DIR}; explain_repo cldr) "(generated)"
else
    echo "- DATA: " $(cd ${INDATA}; explain_repo cldr-staging)
fi
echo "- TOOL: " $(cd ${CLDR_DIR}; explain_repo cldr)
echo "- SCRIPT: " $(explain_repo cldr-json)

