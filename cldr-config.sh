#!/bin/sh

# Don't modify this file for temporary changes.
# create an executable ./local-config.sh and it will be used instead.

# where CLDR is
CLDR_DIR=../cldr

# output of generated JSON
OUT=./cldr-json

# input data, assumed to be in a parallel repo
# <https://github.com/unicode-org/cldr-staging.git>
INDATA=../cldr-staging/production

# output of .zip files
DIST=./dist

# which types to generate
TYPES=all

# Only these files
MATCH='.*'

# what draft status to consider
DRAFTSTATUS="contributed"

# override the version number of CLDR
#VERSION="39.0.0"
