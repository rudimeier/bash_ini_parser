
# Test 7
#
# Option: [--prefix | -p] PREFIX

. ../read_ini.sh

# First: valid value for prefix
echo "# 1"
unset PREFIX1
declare -A PREFIX1
read_ini test7.ini --prefix PREFIX1

echo "var1:${PREFIX1[var1]}"
echo "section1 var1:${PREFIX1[section1__var1]}"

# Second: invalid value for prefix (contains illegal chars)
echo "# 2"

# unset and declare gives error anyway
#unset PR:EFIX
#declare -A PR:EFIX
read_ini -p PR:EFIX, test7.ini &&
{
	echo "var1:${PREFIX1[var1]}"
	echo "section1 var1:${PREFIX1[section1__var1]}"
}

# Third: invalid value for prefix (begins with a number)
echo "# 3"

# unset and declare gives error anyway
#unset 1PREFIX
#declare -A 1PREFIX
read_ini --prefix 1PREFIX test7.ini &&
{
	echo "var1:${PREFIX1[var1]}"
	echo "section1 var1:${PREFIX1[section1__var1]}"
}
