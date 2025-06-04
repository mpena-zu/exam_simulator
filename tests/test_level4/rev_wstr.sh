#!/bin/bash

exec_bin="$1"
fail=0

if [ -z "$exec_bin" ]; then
    echo "Usage: $0 <executable>"
    exit 1
fi

run_test() {
    input="$1"
    expected="$2"

    result=$("$exec_bin" "$input" | cat -e)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed for input: \"$input\""
    fi
}

run_test "You hate people! But I love gatherings. Isn't it ironic?" "ironic? it Isn't gatherings. love I But people! hate You$"
run_test "abcdefghijklm" "abcdefghijklm$"
run_test "Wingardium Leviosa" "Leviosa Wingardium$"

result=$("$exec_bin" | cat -e)
if [ "$result" = "$" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    echo "Got     : \"$result\""
    fail=1
fi

result=$("$exec_bin" "42" "21" | cat -e)
if [ "$result" = "$" ]; then
    echo "✅ Passed for multiple arguments"
else
    echo "❌ Failed for multiple arguments"
    echo "Got     : \"$result\""
    fail=1
fi

exit $fail
