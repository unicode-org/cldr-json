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
Latest official release is version 36.0.0, published on 2019-10-04

## Tags

Each repository is tagged with the release it pertains to, for example `36.0.0`.

## Licensing

This project is distributed by the [Unicode Consortium Terms of Use](http://unicode.org/repos/cldr/trunk/unicode-license.txt)

## Dependencies

This project requires the following other projects to run:
 * none

## Package Organization

Because the CLDR is so large and contains so many different types of information, the JSON data
here is grouped into packages by functionality. For each type of functionality, there are two
available packages: The "[modern][]" packages, which contain the set of locales listed as modern
coverage targets by the CLDR subcomittee, and the "[full][]" packages, which contain the complete
set of locales, including those in the corresponding modern packages. The functional groups are:

 - **[cldr-core][]**        – Basic CLDR supplemental data — only one package here, no "full" and "modern".
 - **[cldr-dates][]**       – Data for date/time formatting, including data for Gregorian calendar.
Requires that the corresponding **[cldr-numbers][]** package be installed as well.
 - **cldr-cal-[type]**      – CLDR data for non-Gregorian calendars. [type] is one of the supported non-Gregorian calendar types in CLDR: 
[buddhist][], [chinese][], [coptic][], [dangi][], [ethiopic][], [hebrew][], [indian][], [islamic][], [japanese][], [persian][], or [roc][].
 - **[cldr-localenames][]** – Translated versions of locale display name elements: languages, scripts, territories, and variants.
 - **[cldr-misc][]**        – Other CLDR data not defined elsewhere.
 - **[cldr-numbers][]**     – Data for number formatting.
 - **[cldr-rbnf][]**        – Rule Based Number Formatting data — only one package here, no "full" and "modern".
 - **[cldr-segments][]**    – Line breaking data from Unicode's [ULI project](http://uli.unicode.org/)
 - **[cldr-units][]**       – Data for units formatting.

## Installation

Installation using [NPM](https://www.npmjs.com):

    $ npm install <package-name> , where <package-name> is one of the package names mentioned above, for example:

    $ npm install cldr-dates-full

Installation using [bower](http://bower.io):

    $ bower install <package-name> , where <package-name> is one of the package names mentioned above, for example:

    $ bower install cldr-dates-full

## Bug reports

CLDR does NOT use Github's issue tracking system to track bugs.  If you find an error in
the data contained here, please file a new ticket at [Unicode Jira](https://unicode-org.atlassian.net/projects/CLDR/issues)

[cldr-core]: https://github.com/unicode-cldr/cldr-core
[cldr-dates]: https://github.com/unicode-cldr?q=cldr-dates
[cldr-localenames]: https://github.com/unicode-cldr?q=cldr-localenames
[cldr-misc]: https://github.com/unicode-cldr?q=cldr-misc
[cldr-numbers]: https://github.com/unicode-cldr?q=cldr-numbers
[cldr-rbnf]: https://github.com/unicode-cldr/cldr-rbnf
[cldr-segments]: https://github.com/unicode-cldr?q=cldr-segments
[cldr-units]: https://github.com/unicode-cldr?q=cldr-units
[buddhist]: https://github.com/unicode-cldr?q=cldr-cal-buddhist
[chinese]: https://github.com/unicode-cldr?q=cldr-cal-chinese
[coptic]: https://github.com/unicode-cldr?q=cldr-cal-coptic
[dangi]: https://github.com/unicode-cldr?q=cldr-cal-dangi
[ethiopic]: https://github.com/unicode-cldr?q=cldr-cal-ethiopic
[hebrew]: https://github.com/unicode-cldr?q=cldr-cal-hebrew
[indian]: https://github.com/unicode-cldr?q=cldr-cal-indian
[islamic]: https://github.com/unicode-cldr?q=cldr-cal-islamic
[japanese]: https://github.com/unicode-cldr?q=cldr-cal-japanese
[persian]: https://github.com/unicode-cldr?q=cldr-cal-persian
[roc]: https://github.com/unicode-cldr?q=cldr-cal-roc
[modern]: https://github.com/unicode-cldr?q=modern
[full]: https://github.com/unicode-cldr?q=full
