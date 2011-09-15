
# Test 9
#
# further stuff which didn't worked in 0.3

. ../read_ini.sh

unset INI
declare -A INI
if ! read_ini test9.ini ;then exit 1; fi


echo "var1:${INI[var1]}"
echo "var2:${INI[var2]}"
echo "var3:${INI[var3]}"
echo "var4:${INI[var4]}"
echo "var5:${INI[var5]}"
echo "var6:${INI[var6]}"

