
# Testing booleans processing

# First: with default booleans processing (on)
. ../read_ini.sh

unset INI
declare -A INI
read_ini test6.ini

echo "yes1:${INI[yes1]}"
echo "yes2:${INI[yes2]}"
echo "yes3:${INI[yes3]}"
echo "true1:${INI[true1]}"
echo "true2:${INI[true2]}"
echo "true3:${INI[true3]}"
echo "on1:${INI[on1]}"
echo "on2:${INI[on2]}"
echo "on3:${INI[on3]}"

echo "no1:${INI[no1]}"
echo "no2:${INI[no2]}"
echo "no3:${INI[no3]}"
echo "false1:${INI[false1]}"
echo "false2:${INI[false2]}"
echo "false3:${INI[false3]}"
echo "off1:${INI[off1]}"
echo "off2:${INI[off2]}"
echo "off3:${INI[off3]}"


# Second: with booleans processing explicitly turned on via "--booleans 1"

unset INI
declare -A INI
read_ini --booleans 1 test6.ini

echo "yes1:${INI[yes1]}"
echo "true2:${INI[true2]}"
echo "on3:${INI[on3]}"

echo "no3:${INI[no3]}"
echo "false2:${INI[false2]}"
echo "off1:${INI[off1]}"


# Third: with booleans processing explicity switched off via "--booleans 0"
unset INI
declare -A INI
read_ini test6.ini --booleans 0

echo "yes1:${INI[yes1]}"
echo "true2:${INI[true2]}"
echo "on3:${INI[on3]}"

echo "no3:${INI[no3]}"
echo "false2:${INI[false2]}"
echo "off1:${INI[off1]}"




