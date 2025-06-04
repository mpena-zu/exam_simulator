#!/bin/bash

exec=epur_str
fail=0

run_test() {
    input="$1"
    expected="$2"

    if [ -z "$input" ]; then
        result=$(./tests/test_level3/test_exec_${exec} 2>&1)
    else
        result=$(./tests/test_level3/test_exec_${exec} "$input" 2>&1)
    fi

    result=$(echo "$result" | tr -d '\r')

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed for input: \"$input\""
    fi
}


run_test "vous voyez c'est facile d'afficher la meme chose" "vous voyez c'est facile d'afficher la meme chose"
run_test " seulement          la c'est      plus dur " "seulement la c'est plus dur"
run_test "" ""
run_test "a    b     c" "a b c"

result=$(./tests/test_level3/test_exec_${exec} "arg1" "arg2" 2>/dev/null)
if [ "$result" = "" ]; then
    echo "✅ Passed for multiple arguments"
else
    echo "❌ Failed for multiple arguments"
    fail=1
fi

exit $fail
