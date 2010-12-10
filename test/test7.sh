
# Test 7
#
# Option: [--prefix | -p] PREFIX

# First: valid value for prefix
echo "# 1"
. ../read_ini.sh
read_ini test7.ini --prefix PREFIX1

echo "var1:$PREFIX1__var1"
echo "section1 var1:$PREFIX1__section1__var1"

# Second: invalid value for prefix (contains illegal chars)
echo "# 2"
. ../read_ini.sh
read_ini -p PR:EFIX, test7.ini &&
{
	echo "var1:$PREFIX1__var1"
	echo "section1 var1:$PREFIX1__section1__var1"
}

# Third: invalid value for prefix (begins with a number)
echo "# 3"
. ../read_ini.sh
read_ini --prefix 1PREFIX test7.ini &&
{
	echo "var1:$PREFIX1__var1"
	echo "section1 var1:$PREFIX1__section1__var1"
}
