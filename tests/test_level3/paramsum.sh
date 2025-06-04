#!/bin/bash

exec=paramsum
fail=0

gcc -Wall -Wextra -Werror "current_exercise/level3/${exec}.c" -o "$exec"
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

run_test() {
    input="$1"
    expected="$2"

    result=$(./$exec $input)

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test "1 2 3 5 7 24" "6"
run_test "6 12 24" "3"
run_test "" "0"
run_test "hello world" "2"
run_test "foo" "1"
run_test "one two three four five" "5"

exit $fail
