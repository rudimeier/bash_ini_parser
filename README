
bash_ini_parser -- Simple INI file parser
=========================================

This is a comfortable and simple INI file parser to be used in
bash scripts.




COPYRIGHT
---------

Copyright (c) 2009 Kevin Porter / Advanced Web Construction Ltd
(http://coding.tinternet.info / http://webutils.co.uk)
Copyright (c) 2010, 2011 Ruediger Meier <sweet_f_a@gmx.de>
(https://github.com/rudimeier/)




USAGE
-----

You must source the bash file into your script:

> . read_ini.sh

and then use the read_ini function, defined as:

> read_ini INI_FILE [SECTION] [[--prefix|-p] PREFIX] [[--booleans|b] [0|1]]

If SECTION is supplied, then only the specified section of the file will
be processed.

After running the read_ini function, variables corresponding to the ini
file entries will be available to you. Naming convention for variable
names is:

PREFIX__SECTION__VARNAME

PREFIX is 'INI' by default (but can be changed with the --prefix option),
SECTION and VARNAME are the section name and variable name respectively.
For example, to read and output the variables of this ini file:

-- START test1.ini file

var1="VAR 1"
var2 = VAR 2

[section1]
var1="section1 VAR 1"
var2= section1 VAR 2


-- END test1.ini file

you could do this:

-- START bash script

. read_ini.sh

read_ini test1.ini

echo "var1 = ${INI__var1}"
echo "var2 = ${INI__var2}"
echo "section1 var1 = ${INI__section1__var1}"
echo "section1 var2 = ${INI__section1__var2}"

-- END bash script




OPTIONS
-------

[--prefix | -p] PREFIX
String to prepend to generated variable names (automatically followed by '__').
Default: INI

[--booleans | -b] [0|1]
Whether to interpret special unquoted string values 'yes', 'no', 'true',
'false', 'on', 'off' as booleans.
Default: 1




INI FILE FORMAT
---------------

- Variables are stored as name/value pairs, eg:
var=value

- Leading and trailing whitespace of the name and the value is discarded.

- Use double or single quotes to get whitespace in the values

- Section names in square brackets, eg:
[section1]
var1 = value

- Variable names can be re-used between sections (or out of section), eg:
var1=value
[section1]
var1=value
[section3]
var1=value

- Dots are converted to underscores in all variable names.

- Special boolean values: unquoted strings 'yes', 'true' and 'on' are interpreted
	as 1; 'no', 'false' and 'off' are interpreted as 0



