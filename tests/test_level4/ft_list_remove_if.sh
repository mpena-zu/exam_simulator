#!/bin/bash

BINARY="$1"
fail=0

run_test() {
    local input="$1"
    local remove_val="$2"
    local expected="$3"
    local output

    output=$("$BINARY" "$input" "$remove_val")

    if [ "$output" != "$expected" ]; then
        echo "❌ Failed for input: $input removing: $remove_val"
        echo "Expected: $expected"
        echo "Got     : $output"
        fail=1
    else
        echo "✅ Passed for input: $input removing: $remove_val"
    fi
}

run_test "a,b,c,a" "a" "b,c"
run_test "1,2,3,4,2" "2" "1,3,4"
run_test "x,x,x,x" "x" ""
run_test "hello,world,test" "test" "hello,world"
run_test "" "anything" ""

if [ $fail -eq 0 ]; then
    echo "✅ All tests passed!"
fi

exit $fail
