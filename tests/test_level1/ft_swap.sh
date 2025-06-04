#!/bin/bash

BINARY="$1"

run_test() {
	input1=$1
	input2=$2
	expected="$2 $1"

	output=$("$BINARY" "$input1" "$input2")
	if [ "$output" == "$expected" ]; then
		echo "✅ Passed: $input1 $input2"
	else
		echo "❌ Failed: $input1 $input2"
		echo "Expected: $expected"
		echo "Got:      $output"
		exit 1
	fi
}

run_test 1 2
run_test -10 42
run_test 0 0
run_test 12345 -67890
run_test 2147483647 -2147483648

echo "✅ All tests passed for ft_swap!"
exit 0
