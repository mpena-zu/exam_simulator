#!/bin/bash

exec=pgcd
fail=0

gcc -Wall -Wextra -Werror "current_exercise/level3/${exec}.c" -o "$exec"
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

run_test() {
    local input1="$1"
    local input2="$2"
    local expected="$3"

    result=$(./$exec "$input1" "$input2")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: \"$input1\" \"$input2\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed for input: \"$input1\" \"$input2\""
    fi
}

run_test 42 10 "2"
run_test 42 12 "6"
run_test 14 77 "7"
run_test 17 3  "1"

result=$(./$exec)
if [ "$result" = "" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    echo "Expected empty output"
    echo "Got: \"$result\""
    fail=1
fi

result=$(./$exec 42)
if [ "$result" = "" ]; then
    echo "✅ Passed for 1 argument"
else
    echo "❌ Failed for 1 argument"
    fail=1
fi

result=$(./$exec 1 2 3)
if [ "$result" = "" ]; then
    echo "✅ Passed for 3 arguments"
else
    echo "❌ Failed for 3 arguments"
    fail=1
fi

exit $fail
