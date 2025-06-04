#!/bin/bash

exec=tests/test_level2/test_exec_max
fail=0

run_test() {
    input=("$@")
    expected=${input[-1]}
    unset 'input[-1]'

    result=$("$exec" "${input[@]}")
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: ${input[*]}"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: ${input[*]}"
    fi
}

run_test 1 2 3 3
run_test 10 9 8 10
run_test 0 0
run_test 5 5 5 5 5
run_test -2 -3 -1 -1
run_test 0 0

exit $fail
