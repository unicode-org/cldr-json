# cldr-json

This repository provides the JSON distribution of CLDR locale data for internationalization

It should be noted that XML (not JSON) is the "official" format for all CLDR data.  The
JSON data contained herein is provided as a convenience for the development community, and
is programatically generated from the corresponding XML, using the JSON conversion utility
that is provided as part of the CLDR tooling (written in Java).

The data in these packages is intended to serve as a common reference point for most
JavaScript packages. As such, this JSON data is generated using only data that has achieved
draft="contributed" or draft="approved" status in the CLDR. This is the same threshhold
as is used by the ICU (International Components for Unicode - http://icu-project.org ).

If you require JSON data containing provisional or unconfirmed data, you can generate it
using the Ldml2JSON conversion utility in CLDR's tools distribution ( org.unicode.cldr.json ).

## Status
No official release yet - first official version will be 27.0.0,
which should be published on or about 2015-03-18

## Licensing

This project is distributed by the Unicode Consortium Terms of Use
http://unicode.org/repos/cldr/trunk/unicode-license.txt

## Dependencies

This project requires the following other projects to run:
 * none

## Package Organization

Because the CLDR is so large and contains so many different types of information, the JSON data
here is grouped into packages by functionality. For each type of functionality, there are two
available packages: The "modern" packages, which contains the set of locales listed as modern
coverage targets by the CLDR subcomittee, and the "full" package, which contains the rest of the
locales not in the modern coverage listing. The functional packages are:

 * cldr-core        - Basic CLDR supplemental data - Only one package here - no "full" and "modern".
 * cldr-dates       - Data for date/time formatting, including data for Gregorian calendar.
                      Requires that the corresponding "numbers" package be installed as well.
 * cldr-cal-<type>  - CLDR data for non-Gregorian calendars. <type> is one of the supported
                      non-Gregorian calendar types in CLDR: ( buddhist, chinese, coptic, dangi,
                      hebrew, indian, islamic, japanese, persian, roc ).
 * cldr-localenames - Translated versions of locale display name elements: languages, scripts,
                      territories, variants.
 * cldr-misc        - Other CLDR data not defined elsewhere.
 * cldr-numbers     - Data for number formatting.
 * cldr-units       - Data for units formatting.

## Installation

_Bower_ release installation:

    $ bower install <package-name> , where <package-name> is one of the package names mentioned
                                     above, for example:

    $ bower install cldr-dates-full

