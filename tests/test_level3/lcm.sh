#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local a="$1"
    local b="$2"
    local expected="$3"

    output=$($exec_bin "$a" "$b")

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: ($a, $b)"
    else
        echo "❌ Failed for input: ($a, $b)"
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_all_tests() {
    run_test 0 5 0
    run_test 7 5 35
    run_test 21 6 42
    run_test 13 17 221
    run_test 0 0 0
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
