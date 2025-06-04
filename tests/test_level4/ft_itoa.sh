#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local input="$1"
    local expected="$2"

    output=$($exec_bin "$input")

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: $input"
    else
        echo "❌ Failed for input: $input"
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_all_tests() {
    run_test -2147483648 "-2147483648"
    run_test -1000 "-1000"
    run_test -1 "-1"
    run_test 0 "0"
    run_test 1 "1"
    run_test 42 "42"
    run_test 12345 "12345"
    run_test 2147483647 "2147483647"
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
