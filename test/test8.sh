

# Test 8
#
# Prevention of in-value code execution via invalid section

. ../read_ini.sh

unset INI
declare -A INI
read_ini test8.ini

