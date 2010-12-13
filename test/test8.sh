

# Test 8
#
# Prevention of in-value code execution via invalid section

. ../read_ini.sh

unset INI
declare -A INI
read_ini test8.ini

echo ${!INI[@]}
for i in "${!INI[@]}" ;do
	echo "${i}:::::${INI["$i"]}"
done
