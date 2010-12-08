#
# Copyright (c) 2009	Kevin Porter / Advanced Web Construction Ltd
#						(http://coding.tinternet.info, http://webutils.co.uk)
#
# Simple INI file parser.
#
# See README for usage.
#
#


function read_ini()
{

	local INI_FILE=""
	local INI_SECTION=""

	# {{{ START Deal with command line args

	# Set defaults
	local BOOLEANS=1
	local VARNAME_PREFIX=INI

	# {{{ START Options

	# Available options:
	#	--boolean		Whether to recognise special boolean values: ie for 'yes', 'true'
	#					and 'on' return 1; for 'no', 'false' and 'off' return 0. Quoted
	#					values will be left as strings
	#					Default: on
	#
	#	--prefix=STRING	String to begin all returned variables with (followed by '__').
	#					Default: INI
	#
	#	First non-option arg is filename, second is section name

	while [ $# -gt 0 ]
	do

		case $1 in

			--booleans | -b )
				shift
				BOOLEANS=$1
			;;

			--prefix | -p )
				shift
				VARNAME_PREFIX=$1
			;;

			* )
				if [ -z "$INI_FILE" ]
				then
					INI_FILE=$1
				else
					if [ -z "$INI_SECTION" ]
					then
						INI_SECTION=$1
					fi
				fi
			;;

		esac

		shift
	done

	if [ -z "$INI_FILE" ]
	then
		echo "Usage: read_ini FILE [SECTION]" >&2
		return 1
	fi

	if [ ! -f "$INI_FILE" ]
	then
		echo "Error: ini file '${INI_FILE}' doesn't exist" >&2
		return 1
	fi

	# Be strict with the prefix, since it's going to be run through eval
	local PREFIX_BANNED_CHARS=$(echo "$VARNAME_PREFIX" | sed 's/[a-z0-9_]//ig')

	if [ -n "$PREFIX_BANNED_CHARS" ]
	then
		echo "Invalid characters ('${PREFIX_BANNED_CHARS}') in variable name prefix ('${VARNAME_PREFIX}')" >&2
		return 1
	fi

	# Prefix can't start with a number
	local FIRSTCHAR=${VARNAME_PREFIX:0:1}
	local BEGINS_WITH_NUMBER=""
	case $FIRSTCHAR in
		0|1|2|3|4|5|6|7|8|9)
			echo "Invalid variable name prefix - must not begin with a number" >&2
			return 1
		;;
	esac

	# Sanitise BOOLEANS - interpret "0" as 0, anything else as 1
	if [ "$BOOLEANS" != "0" ]
	then
		BOOLEANS=1
	fi


	# }}} END Options

	# }}} END Deal with command line args

	local LINE_NUM=0
	local SECTION=""
	while read line
	do

#echo line = "$line"

		((LINE_NUM++))

		# Skip blank lines and comments
		if [ -z "$line" -o "${line:0:1}" = ";" -o "${line:0:1}" = "#" ]
		then
			continue
		fi

		# Section marker?
		if [[ "${line}" =~ ^\[.*\]$ ]]
		then

			# Set SECTION var to name of section (strip [ and ] from section marker)
			SECTION="${line#[}"
			SECTION="${SECTION%]}"

			continue
		fi

		# Are we getting only a specific section? And are we currently in it?
		if [ ! -z "$INI_SECTION" ]
		then
			if [ "$SECTION" != "$INI_SECTION" ]
			then
				continue
			fi
		fi


		local VAR="$(expr match "${line}" '^ *\([a-zA-Z0-9._-]\{1,\}\)[[:space:]]*=')"
		local VAL="$(expr match "${line}" '^[^=]*=[[:space:]]*\(.*\)')"
		VAR=$(echo $VAR)

		# Valid var/value line? (check for variable name and then '=')
		if [ -z ${VAR} ]
		then
			echo "Error: Invalid line:" >&2
			echo " ${LINE_NUM}: $line" >&2
			return 1
		fi


		# Construct variable name:
		# ${VARNAME_PREFIX}__$SECTION__$VAR
		# Or if not in a section:
		# ${VARNAME_PREFIX}__$VAR
		# In both cases, full stops ('.') are replaced with underscores ('_')
		if [ -z "$SECTION" ]
		then
			VARNAME=${VARNAME_PREFIX}__${VAR//./_}
		else
			VARNAME=${VARNAME_PREFIX}__${SECTION}__${VAR//./_}
		fi

		# Surround VAL with quotes if it isn't already
		local FIRSTCHAR=${VAL:0:1}
		local LASTCHAR=${VAL:(-1):1}
		local DOUBLEQUOTES=""
		local SINGLEQUOTES=""

		if [ "$FIRSTCHAR" = '"' -a "$LASTCHAR" = '"' ]
		then
			DOUBLEQUOTES=1
		fi

		if [ "$FIRSTCHAR" = "'" -a "$LASTCHAR" = "'" ]
		then
			SINGLEQUOTES=1
		fi

		if [ -z "$SINGLEQUOTES" -a -z "$DOUBLEQUOTES" ]
		then
			# Value is not enclosed in quotes

			# If we have booleans processing switched on, check for special boolean
			# values and convert
			if [ "$BOOLEANS" == 1 ]
			then

				# Check length of string first. Since we're going to use tr command to convert
				# the string to lowercase, it'll be more efficient if we check string length
				# first. If value is more than 5 chars then it can't possibly be one of the
				# special boolean values
				if [ "${#VAL}" -le 5 ]
				then

					# Convert to lower case
					local VAL_LOWER=$(echo "$VAL" | tr '[:upper:]' '[:lower:]')

					case "$VAL_LOWER" in
						yes | true | on )
							VAL=1
						;;
						no | false | off )
							VAL=0
						;;
					esac
				fi

			fi

			# We'll enclose the value in double quotes now, so we must escape any
			# double quotes that may be in the value first
			VAL=$(echo "$VAL" | awk '{sub(/"/,"\\\"",$0); print $0;}')
			VAL="\"$VAL\""
		fi

		# Replace $ and ` to prevent code running inside eval
		VAL=${VAL//\`/\\\`}
		VAL=${VAL//\$/\\\$}
#declare -x $VARNAME="$VAL"
		eval "$VARNAME=$VAL"
	done < <(cat $INI_FILE)
}


