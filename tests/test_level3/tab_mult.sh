#!/bin/bash

exec=tab_mult
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(eval ./tests/test_level3/test_exec_${exec} $input)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected:"
        echo "$expected"
        echo "Got:"
        echo "$result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test 9 $'1 x 9 = 9\n2 x 9 = 18\n3 x 9 = 27\n4 x 9 = 36\n5 x 9 = 45\n6 x 9 = 54\n7 x 9 = 63\n8 x 9 = 72\n9 x 9 = 81'
run_test 19 $'1 x 19 = 19\n2 x 19 = 38\n3 x 19 = 57\n4 x 19 = 76\n5 x 19 = 95\n6 x 19 = 114\n7 x 19 = 133\n8 x 19 = 152\n9 x 19 = 171'
run_test 1 $'1 x 1 = 1\n2 x 1 = 2\n3 x 1 = 3\n4 x 1 = 4\n5 x 1 = 5\n6 x 1 = 6\n7 x 1 = 7\n8 x 1 = 8\n9 x 1 = 9'
run_test 5 $'1 x 5 = 5\n2 x 5 = 10\n3 x 5 = 15\n4 x 5 = 20\n5 x 5 = 25\n6 x 5 = 30\n7 x 5 = 35\n8 x 5 = 40\n9 x 5 = 45'
run_test 12 $'1 x 12 = 12\n2 x 12 = 24\n3 x 12 = 36\n4 x 12 = 48\n5 x 12 = 60\n6 x 12 = 72\n7 x 12 = 84\n8 x 12 = 96\n9 x 12 = 108'

result=$(./tests/test_level3/test_exec_${exec})
if [ "$result" = $'\n' ] || [ -z "$result" ]; then
    echo "✅ Passed for no arguments"
else
    echo "❌ Failed for no arguments"
    echo "Expected: (empty line)"
    echo "Got: $result"
    fail=1
fi

exit $fail
