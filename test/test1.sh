

# Test 1
#
# Basic variable values; leading/trailing whitespace; comments

. ../read_ini.sh

unset INI
declare -A INI
read_ini test1.ini

#echo "a:LOCALVAR=$LOCALVAR"
echo "var1:${INI[var1]}"
echo "var2:${INI[var2]}"
echo "var3:${INI[var3]}"
echo "var4:${INI[var4]}"
echo "var5:${INI[var5]}"
echo "var6:${INI[var6]}"
echo "var7:${INI[var7]}"
echo "var8:${INI[var8]}"
echo "var9:${INI[var9]}"
echo "var10:${INI[var10]}"
echo "var11:${INI[var11]}"

