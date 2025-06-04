#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local input="$1"
    local expected="$2"

    output=$($exec_bin "$input")

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: \"$input\""
    else
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_all_tests() {
    run_test "4 2 1 3" "1 2 3 4"
    run_test "10 5 5 7 1" "1 5 5 7 10"
    run_test "9 8 7 6 5" "5 6 7 8 9"
    run_test "42" "42"
    run_test "" ""
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
