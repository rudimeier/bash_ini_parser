

# Test 5
#
# Prevention of in-value code execution via backticks or $() notation.
# This must be done because the value is run through an eval statement.

. ../read_ini.sh
read_ini test5.ini

echo "var1:$INI__var1"
echo "var2:$INI__var2"

