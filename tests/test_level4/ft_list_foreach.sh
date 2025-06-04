#!/bin/bash

BINARY="$1"

fail=0

run_test() {
    local input="$1"
    local expected="$2"
    local output

    output=$("$BINARY" "$input")

    if [ "$output" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $output"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test "test1" "a,b,c,"
run_test "test2" "1,2,3,4,"
run_test "" ""

if [ $fail -eq 0 ]; then
    echo "✅ All tests passed!"
fi

exit $fail
