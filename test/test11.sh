
# Test 11
#
# Python configuration file format - empty values not allowed

. ../read_ini.sh

unset INI
declare -A INI
read_ini --booleans 0 test11.ini

echo "No Values_empty string value here:${INI[No Values__empty string value here]}"
