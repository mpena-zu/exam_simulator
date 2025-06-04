#!/bin/bash

BINARY="$1"

run_test() {
    local input="$1"
    local expected="$2"

    "$BINARY" "$input" | grep -qxF "$expected" || {
        echo "❌ Test failed for input: '$input'"
        exit 1
    }
}

run_test "Hello" "Hello"
run_test "42Madrid" "42Madrid"
run_test "With spaces!" "With spaces!"
run_test "Special chars !@#^&*()" "Special chars !@#^&*()"
run_test "1234567890" "1234567890"

echo "✅ All tests passed for ft_strcpy!"
exit 0
