#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local input=($1)
    local expected="$2"

    output=$($exec_bin "${input[@]}")

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: $1"
    else
        echo "❌ Failed for input: $1"
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_all_tests() {
    run_test "3 2 1" "1 2 3"
    run_test "5 3 5 2 8" "2 3 5 5 8"
    run_test "1" "1"
    run_test "10 9 8 7 6 5 4 3 2 1" "1 2 3 4 5 6 7 8 9 10"
    run_test "-1 0 1" "-1 0 1"
    run_test "42 42 42 42" "42 42 42 42"
    run_test "100 50 0 -50 -100" "-100 -50 0 50 100"
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
