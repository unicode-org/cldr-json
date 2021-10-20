# cldr-json

JSON distribution of [CLDR](http://cldr.unicode.org/) locale data for internationalization

It should be noted that XML (not JSON) is the "official" format for all CLDR data.  The
JSON data contained in the packages described [below](#package-organization) is provided
as a convenience for the development community, and is programatically generated from the
corresponding XML, using the JSON conversion utility that is provided as part of the CLDR
tooling (written in Java).

The data in these packages is intended to serve as a common reference point for most
JavaScript packages. As such, this JSON data is generated using only data that has achieved
`draft="contributed"` or `draft="approved"` status in the CLDR. This is the same threshhold
as is used by the [ICU](http://icu-project.org) (International Components for Unicode).

If you require JSON data containing provisional or unconfirmed data, or data that is customized
in any way, you can generate it using the Ldml2JSON conversion utility in CLDR's tools
distribution (`org.unicode.cldr.json`).

## Status
Latest official release is version 39.0.0, published on 2021-04-30

## Tags

Previously, each repository was tagged with the release it pertains to, for example `38.0.0`.
Now, only the `cldr-json` repo will be used, and it will contain all data in a single tag.

## Updating

1. Check out the [`cldr-staging`](https://github.com/unicode-org/cldr-staging) repo as a sibling to this one. This will be the data source.
2. Check out the [`cldr`](https://github.com/unicode-org/cldr) repo as a sibling to this one and set it up so maven builds are possible.
3. Run the script `cldr-generate-json.sh`
4. Data will be updated in the `cldr-json` subdirectory.
5. Run the script `cldr-generate-zips.sh` to generate zipfiles under `dist/`
6. npm packages can be updated as well. Each sub-subdirectory is an npm package. The following script will preview
(dry run) publishing to npm under the `beta` tag.

```shell
(cd cldr-json; for repo in $(ls); do (cd $repo; npm publish --tag beta --dry-run); done)
```

See `cldr-config.sh` for customization options.

See [Updating JSON Data](http://cldr.unicode.org/development/updating-codes/updating-json-data)
for detailed instructions.

## Licensing

This project is distributed by the [Unicode Consortium Terms of Use](http://unicode.org/repos/cldr/trunk/unicode-license.txt)

## Dependencies

This project requires the following other projects to run:
 * none

## Package Organization

Because the CLDR is so large and contains so many different types of information, the JSON data
here is grouped into packages by functionality. For each type of functionality, there are two
available packages: The "modern" packages, which contain the set of locales listed as modern
coverage targets by the CLDR subcomittee, and the "full" packages, which contain the complete
set of locales, including those in the corresponding modern packages. The functional groups are:

 - **cldr-core**        – Basic CLDR supplemental data — only one package here, no "full" and "modern".
 - **cldr-dates**       – Data for date/time formatting, including data for Gregorian calendar.
Requires that the corresponding **cldr-numbers** package be installed as well.
 - **cldr-cal-_type_**      – CLDR data for non-Gregorian calendars. _type_ is one of the supported non-Gregorian calendar types in CLDR: buddhist, chinese, coptic, dangi, ethiopic, hebrew, indian, islamic, japanese, persian, or roc.
 - **cldr-localenames** – Translated versions of locale display name elements: languages, scripts, territories, and variants.
 - **cldr-misc**        – Other CLDR data not defined elsewhere.
 - **cldr-numbers**     – Data for number formatting.
 - **cldr-rbnf**        – Rule Based Number Formatting data — only one package here, no "full" and "modern".
 - **cldr-segments**    – Line breaking data from Unicode's [ULI project](http://uli.unicode.org/)
 - **cldr-units**       – Data for units formatting.

## Installation

Installation using [npm](https://www.npmjs.com):

    $ npm install <package-name> , where <package-name> is one of the package names mentioned above, for example:

    $ npm install cldr-dates-full

(Note that bower is deprecated, please use npm.)

## Who uses cldr-json?

See [USERS.md](./USERS.md) for a list of libraries
which use this data.

## Bug reports

CLDR does not use Github's issue tracking system to track bugs.  If you find an error in
the data contained here, please file a new ticket at [Unicode Jira](https://unicode-org.atlassian.net/projects/CLDR/issues)
