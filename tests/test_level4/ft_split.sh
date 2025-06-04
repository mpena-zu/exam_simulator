#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local input="$1"
    local expected="$2"
    local output

    output=$("$exec_bin" "$input")

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
    run_test "hello world" "hello,world"
    run_test "   hello   world  " "hello,world"
    run_test "   " ""
    run_test "" ""
    run_test "one" "one"
    run_test "one two three four" "one,two,three,four"
}

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_all_tests

exit $fail
