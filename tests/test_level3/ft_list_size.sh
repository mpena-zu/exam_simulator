#!/bin/bash

BINARY="$1"

test_case() {
    local input="$1"
    local expected="$2"
    local output
    output=$("$BINARY" "$input")
    if [ "$output" != "$expected" ]; then
        echo "❌ Test failed for input: $input"
        echo "Expected: $expected"
        echo "Got:      $output"
        exit 1
    fi
}

test_case 0 0
test_case 1 1
test_case 5 5
test_case 10 10
test_case 42 42

echo "✅ All tests passed!"
exit 0
