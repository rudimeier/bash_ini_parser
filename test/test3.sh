
# Test 3
#
# Sections

. ../read_ini.sh

unset INI
declare -A INI
read_ini test3.ini

echo "var1:${INI[var1]}"
echo "var2:${INI[var2]}"

echo "section1_var1:${INI[section1__var1]}"
echo "section1_var2:${INI[section1__var2]}"
echo "section1_var3:${INI[section1__var3]}"

echo "section2_var1:${INI[section2__var1]}"
echo "section2_var2:${INI[section2__var2]}"
echo "section2_var3:${INI[section2__var3]}"
echo "section2_var4:${INI[section2__var4]}"
echo "section2_var5:${INI[section2__var5]}"

echo "section3_var1:${INI[section3__var1]}"
echo "section3_var2:${INI[section3__var2]}"

echo "section-4_var1:${INI[section-4__var1]}"
echo "section-4_var2:${INI[section-4__var2]}"

echo "all sections:$INI__ALL_SECTIONS"
echo "all variables:$INI__ALL_VARS"
echo "number sections:$INI__NUMSECTIONS"
