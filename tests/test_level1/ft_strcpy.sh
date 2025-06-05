#!/bin/bash

BINARY="$1"

run_test() {
    local input="$1"
    local expected="$1"

    output=$("$BINARY" "$input")
    if [ "$output" = "$expected" ]; then
        echo "✅ Passed: '$input'"
    else
        echo "❌ Failed: '$input'"
        echo "Expected: '$expected'"
        echo "Got:      '$output'"
        exit 1
    fi
}

run_test "Hello"
run_test "42Madrid"
run_test "With spaces!"
run_test "Special chars !@#^&*()"
run_test "1234567890"

echo "✅ All tests passed for ft_putstr!"
exit 0
