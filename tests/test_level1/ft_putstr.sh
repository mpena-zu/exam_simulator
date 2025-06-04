#!/bin/bash

BINARY="$1"

test_output() {
    local input="$1"
    local expected="$2"
    local output
    output=$("$BINARY" "$input")
    if [ "$output" != "$expected" ]; then
        echo "Test failed for input: [$input]"
        echo "Expected: [$expected]"
        echo "Got:      [$output]"
        exit 1
    fi
}

test_output "Hello" "Hello"
test_output "" ""
test_output "Hello, 42!" "Hello, 42!"
test_output "1234567890" "1234567890"
test_output $'A\nB\nC' $'A\nB\nC'
test_output "With spaces" "With spaces"
test_output "Special chars !@#$%^&*()" "Special chars !@#$%^&*()"

echo "✅ All tests passed!"
exit 0
