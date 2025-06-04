#!/bin/bash

exec=rotstring
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(./tests/test_level4/test_exec_${exec} "$input")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed for input: \"$input\""
    fi
}

run_test "abc   " "abc"
run_test "Que la      lumiere soit et la lumiere fut" "la lumiere soit et la lumiere fut Que"
run_test "     AkjhZ zLKIJz , 23y" "zLKIJz , 23y AkjhZ"
run_test "first" "first"

result=$(./tests/test_level4/test_exec_${exec})
if [ "$result" = "" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    echo "Expected: \"\""
    echo "Got     : \"$result\""
    fail=1
fi

exit $fail
