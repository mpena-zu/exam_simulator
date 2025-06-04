#!/bin/bash

fail=0

exec="$1"

if [ -z "$exec" ]; then
    echo "Usage: $0 path_to_executable"
    exit 1
fi

run_test() {
    input="$1"
    expected="$2"

    result=$("$exec" "$input" | cat -e)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: \"$input\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: \"$input\""
    fi
}

run_test "FOR PONY" "PONY$"
run_test "this        ...       is sparta, then again, maybe    not" "not$"
run_test "   " "$"
run_test "a" "a$"
run_test "  lorem,ipsum  " "lorem,ipsum$"

result=$("$exec" | cat -e)
if [ "$result" != "$" ]; then
    echo "❌ Failed: no args"
    echo "Expected: \$"
    echo "Got     : $result"
    fail=1
else
    echo "✅ Passed: no args"
fi

result=$("$exec" "one" "two" | cat -e)
if [ "$result" != "$" ]; then
    echo "❌ Failed: too many args"
    echo "Expected: \$"
    echo "Got     : $result"
    fail=1
else
    echo "✅ Passed: too many args"
fi

exit $fail
