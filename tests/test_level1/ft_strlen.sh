#!/bin/bash

BINARY="$1"

run_test() {
    input="$1"
    expected="$2"
    
    output=$("$BINARY" "$input")
    if [ "$output" == "$expected" ]; then
        echo "✅ Passed: \"$input\""
    else
        echo "❌ Failed: \"$input\""
        echo "Expected: $expected"
        echo "Got:      $output"
        exit 1
    fi
}

run_test "" "0"
run_test "a" "1"
run_test "Hello" "5"
run_test "42" "2"
run_test "This is a longer test" "21"
run_test "   " "3"
run_test "!@#$%^&*()" "10"

echo "✅ All tests passed for ft_strlen!"
exit 0
