#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local str="$1"
    local base="$2"
    local expected="$3"

    output=$($exec_bin "$str" "$base")

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: \"$str\" base: $base"
    else
        echo "❌ Failed for input: \"$str\" base: $base"
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_all_tests() {
    run_test "101" 2 5
    run_test "a" 16 10
    run_test "-1a" 16 -26
    run_test "z" 16 0
    run_test "123" 10 123
    run_test "7b" 12 95
    run_test "  -1f" 16 -31
    run_test "" 10 0
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
