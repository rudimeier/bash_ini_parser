
# Test 12
#
# Python configuration file format - empty values allowed

. ../read_ini.sh

unset INI
declare -A INI
read_ini --booleans 0 --allow_no_value 1 test12.ini

echo "No Values_key_without_value:${INI[No Values__key_without_value]}"
echo "No Values_empty string value here:${INI[No Values__empty string value here]}"

echo "number sections:$INI__NUMSECTIONS"
