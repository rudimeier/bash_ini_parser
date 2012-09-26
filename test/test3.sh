
# Test 3
#
# Sections

. ../read_ini.sh

unset INI
declare -A INI
read_ini test3.ini

echo "var1:${INI[var1]}"
echo "var2:${INI[var2]}"

echo "setion1_var1:${INI[section1__var1]}"
echo "setion1_var2:${INI[section1__var2]}"
echo "setion1_var3:${INI[section1__var3]}"

echo "setion2_var1:${INI[section2__var1]}"
echo "setion2_var2:${INI[section2__var2]}"
echo "setion2_var3:${INI[section2__var3]}"
echo "setion2_var4:${INI[section2__var4]}"
echo "setion2_var5:${INI[section2__var5]}"

echo "setion3_var1:${INI[section3__var1]}"
echo "setion3_var2:${INI[section3__var2]}"

echo "number sections:$INI__NUMSECTIONS"
