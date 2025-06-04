#!/bin/bash

BINARY="$1"
HAS_FAILED=0

test_output() {
    local start="$1"
    local end="$2"
    local expected="$3"

    output=$("$BINARY" "$start" "$end")

    if [ "$output" != "$expected" ]; then
        echo "❌ Test FAILED for input: ($start, $end)"
        echo "   Expected: [$expected]"
        echo "   Got:      [$output]"
        HAS_FAILED=1
    else
        echo "✅ Test passed for input: ($start, $end)"
    fi
}

test_output 1 3 "1 2 3"
test_output -1 2 "-1 0 1 2"
test_output 0 0 "0"
test_output 0 -3 "0 -1 -2 -3"
test_output 5 5 "5"
test_output 10 7 "10 9 8 7"
test_output -2 -2 "-2"
test_output -3 -1 "-3 -2 -1"
test_output 4 4 "4"

if [ "$HAS_FAILED" -eq 0 ]; then
    echo "✅ All tests passed!"
    exit 0
else
    echo "❌ Some tests failed."
    exit 1
fi
