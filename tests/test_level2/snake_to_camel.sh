#!/bin/bash

exec=snake_to_camel
fail=0

gcc current_exercise/level2/${exec}.c -o tests/test_level2/test_exec_${exec} || {
    echo "❌ Compilation failed."
    exit 1
}

run_test() {
    input=$1
    expected=$2

    result=$(./tests/test_level2/test_exec_${exec} "$input")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: '$input'"
        echo "Expected: '$expected'"
        echo "Got     : '$result'"
        fail=1
    else
        echo "✅ Passed for input: '$input'"
    fi
}

run_test "here_is_a_snake_case_word" "hereIsASnakeCaseWord"
run_test "hello_world" "helloWorld"
run_test "" ""

exit $fail
