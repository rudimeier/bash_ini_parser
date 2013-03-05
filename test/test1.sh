

# Test 1
#
# Basic variable values; leading/trailing whitespace; comments

. ../read_ini.sh
read_ini test1.ini

#echo "a:LOCALVAR=$LOCALVAR"
echo "var1:$INI__var1"
echo "var2:$INI__var2"
echo "var3:$INI__var3"
echo "var4:$INI__var4"
echo "var5:$INI__var5"
echo "var6:$INI__var6"
echo "var7:$INI__var7"
echo "var8:$INI__var8"
echo "var9:$INI__var9"
echo "var10:$INI__var10"
echo "var11:$INI__var11"
