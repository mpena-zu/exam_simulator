#!/bin/bash

exec=reverse_bits
fail=0

run_test() {
    input=$1
    expected=$2

    result=$(./tests/test_level2/test_exec_${exec} "$input")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test 0   "00000000"
run_test 1   "10000000"
run_test 2   "01000000"
run_test 6   "01100000"
run_test 128 "00000001"
run_test 255 "11111111"

exit $fail
