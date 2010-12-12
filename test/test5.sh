

# Test 5
#
# Prevention of in-value code execution via backticks or $() notation.
# This must be done because the value is run through an eval statement.

. ../read_ini.sh

unset INI
declare -A INI
read_ini test5.ini

echo "var1:${INI[var1]}"
echo "var2:${INI[var2]}"
echo "var3:${INI[var3]}"
echo "var4:${INI[var4]}"
echo "var5:${INI[var5]}"
echo "var6:${INI[var6]}"
