#!/bin/bash

exec=print_hex
fail=0

gcc -Wall -Wextra -Werror "current_exercise/level3/${exec}.c" -o "$exec"
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

run_test() {
    local input="$1"
    local expected="$2"

    result=$(./$exec "$input")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed for input: \"$input\""
    fi
}

run_test "10" "a"
run_test "255" "ff"
run_test "5156454" "4eae66"
run_test "0" "0"
run_test "16" "10"
run_test "4095" "fff"
run_test "123456789" "75bcd15"

result=$(./$exec)
if [ "$result" = "" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    echo "Expected empty output"
    echo "Got: \"$result\""
    fail=1
fi

result=$(./$exec 10 20)
if [ "$result" = "" ]; then
    echo "✅ Passed for too many arguments"
else
    echo "❌ Failed for too many arguments"
    echo "Expected empty output"
    echo "Got: \"$result\""
    fail=1
fi

exit $fail
