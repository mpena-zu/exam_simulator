#!/bin/bash

exec=$1
fail=0

if [ -z "$exec" ]; then
    echo "Usage: $0 path_to_executable"
    exit 1
fi

expected_output=$'11111111\n10001001\n10010001\n10110001\n11100001\n\n11111111\n1FFF1001\n1FF10001\n1F110001\n11100001'

output=$("$exec")

if [ "$output" = "$expected_output" ]; then
    echo "✅ flood_fill output matches expected."
else
    echo "❌ flood_fill output differs from expected."
    echo "Output:"
    echo "$output"
    echo "Expected:"
    echo "$expected_output"
    fail=1
fi

exit $fail
