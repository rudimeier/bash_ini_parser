
# Test 9
#
# further stuff which didn't worked in 0.3

. ../read_ini.sh
if ! read_ini test9.ini ;then exit 1; fi


echo "var1:$INI__var1"
echo "var2:$INI__var2"
echo "var3:$INI__var3"
echo "var4:$INI__var4"
echo "var5:$INI__var5"
echo "var6:$INI__var6"

