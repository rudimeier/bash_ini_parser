
# Test 4
#
# Dots in variable names (converted to underscores in output var names)

. ../read_ini.sh
read_ini test4.ini

echo "var_1:$INI__var_1"
echo "var_two:$INI__var_two"
echo "var_3_two_dots:$INI__var_3_two_dots"

echo "section 1 var_1:$INI__section1__var_1"
echo "section 1 var_two:$INI__section1__var_two"

