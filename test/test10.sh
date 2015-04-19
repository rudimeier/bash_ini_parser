
# Test 10
#
# Python configuration file format

. ../read_ini.sh

unset INI
declare -A INI
read_ini --booleans 0 test10.ini

echo "Simple Values_key:${INI[Simple Values__key]}"
echo "Simple Values_spaces in keys:${INI[Simple Values__spaces in keys]}"
echo "Simple Values_spaces in values:${INI[Simple Values__spaces in values]}"
echo "Simple Values_spaces around the delimiter:${INI[Simple Values__spaces around the delimiter]}"
echo "Simple Values_you can also use:${INI[Simple Values__you can also use]}"

echo "All Values Are Strings_values like this:${INI[All Values Are Strings__values like this]}"
echo "All Values Are Strings_or this:${INI[All Values Are Strings__or this]}"
echo "All Values Are Strings_are they treated as numbers?:${INI[All Values Are Strings__are they treated as numbers?]}"
echo "All Values Are Strings_integers, floats and booleans are held as:${INI[All Values Are Strings__integers, floats and booleans are held as]}"
echo "All Values Are Strings_can use the API to get converted values directly:${INI[All Values Are Strings__can use the API to get converted values directly]}"

echo "Multiline Values_chorus:${INI[Multiline Values__chorus]}"

echo "Sections Can Be Indented_can_values_be_as_well:${INI[Sections Can Be Indented__can_values_be_as_well]}"
echo "Sections Can Be Indented_does_that_mean_anything_special:${INI[Sections Can Be Indented__does_that_mean_anything_special]}"
echo "Sections Can Be Indented_purpose:${INI[Sections Can Be Indented__purpose]}"
echo "Sections Can Be Indented_multiline_values:${INI[Sections Can Be Indented__multiline_values]}"

echo "number sections:$INI__NUMSECTIONS"
