
DIR=$(dirname $0)
cd $DIR

TESTS=$(ls test*.sh | grep -v test.sh | sed 's/\.sh$//')

for test in $TESTS
do

	bash $test.sh &> $test.out
#	bash $test.sh >$test.out 2>$test.err

	# Fail and bail out if test didn't pass
	PASSED=$(diff $test.out $test.out.correct 2>&1)
	if [ ! -z "$PASSED" ]
	then
		echo "Test $test failed. Output is in $DIR/$test.out"
		exit 1
	else
		rm -rf $test.out
	fi

done


echo "All tests passed"


