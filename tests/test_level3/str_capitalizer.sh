#!/bin/bash

exec=str_capitalizer
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(eval ./tests/test_level3/test_exec_${exec} $input)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test '"a FiRSt LiTTlE TESt"' "A First Little Test"
run_test '"a b C"' "A B C"
run_test '"D e f"' "D E F"

result=$(./tests/test_level3/test_exec_${exec})
if [ "$result" = "" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    fail=1
fi

exit $fail
