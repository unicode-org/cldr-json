# Updating CLDR-JSON

## Prerequisites

- A UNIX-like environment
- git
- java and maven
- plenty of memory

## Instructions

1. Check out the [`cldr-staging`](https://github.com/unicode-org/cldr-staging) repo as a sibling to cldr-json. This will be the data source.
2. Check out the [`cldr`](https://github.com/unicode-org/cldr) repo as a sibling to cldr-json and set it up so [maven builds are possible](https://cldr.unicode.org/development/maven).
3. Run the script `cldr-generate-json.sh`
4. Data will be updated in the `cldr-json` subdirectory.
5. Run the script `cldr-generate-zips.sh` to generate zipfiles under `dist/`
6. npm packages can be updated as well. Each sub-subdirectory of `cldr-json/cldr-json` is a separate npm package. The following script will preview
(dry run) publishing to npm under the `beta` tag.

```shell
(cd cldr-json; for repo in $(ls); do (cd $repo; npm publish --tag beta --dry-run); done)
```

See `cldr-config.sh` for customization options.

You can create an executable script named `local-config.sh` with
values to update, for example `VERSION`, `TYPES`, `MATCH` or `DRAFTSTATUS`

## Licenses

- Usage of CLDR data and software is governed by the [Unicode Terms of Use](http://www.unicode.org/copyright.html)
a copy of which is included as [unicode-license.txt](./unicode-license.txt).

SPDX-License-Identifier: Unicode-DFS-2016

## Copyright

Copyright &copy; 1991-2021 Unicode, Inc.
All rights reserved.
[Terms of use](http://www.unicode.org/copyright.html)
