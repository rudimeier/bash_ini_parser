
# Test 4
#
# Dots in variable names (converted to underscores in output var names)

. ../read_ini.sh

unset INI
declare -A INI
read_ini test4.ini

echo "var_1:${INI[var_1]}"
echo "var_two:${INI[var_two]}"
echo "var_3_two_dots:${INI[var_3_two_dots]}"

echo "section 1 var_1:${INI[section1__var_1]}"
echo "section 1 var_two:${INI[section1__var_two]}"

