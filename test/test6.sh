
# Testing booleans processing

# First: with default booleans processing (on)
. ../read_ini.sh
read_ini test6.ini

echo "yes1:$INI__yes1"
echo "yes2:$INI__yes2"
echo "yes3:$INI__yes3"
echo "true1:$INI__true1"
echo "true2:$INI__true2"
echo "true3:$INI__true3"
echo "on1:$INI__on1"
echo "on2:$INI__on2"
echo "on3:$INI__on3"

echo "no1:$INI__no1"
echo "no2:$INI__no2"
echo "no3:$INI__no3"
echo "false1:$INI__false1"
echo "false2:$INI__false2"
echo "false3:$INI__false3"
echo "off1:$INI__off1"
echo "off2:$INI__off2"
echo "off3:$INI__off3"


# Second: with booleans processing explicitly turned on via "--booleans 1"
. ../read_ini.sh
read_ini --booleans 1 test6.ini

echo "yes1:$INI__yes1"
echo "true2:$INI__true2"
echo "on3:$INI__on3"

echo "no3:$INI__no3"
echo "false2:$INI__false2"
echo "off1:$INI__off1"


# Third: with booleans processing explicity switched off via "--booleans 0"
. ../read_ini.sh
read_ini test6.ini --booleans 0

echo "yes1:$INI__yes1"
echo "true2:$INI__true2"
echo "on3:$INI__on3"

echo "no3:$INI__no3"
echo "false2:$INI__false2"
echo "off1:$INI__off1"




