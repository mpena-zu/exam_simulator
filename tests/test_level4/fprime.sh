#!/bin/bash

exec=fprime
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(./tests/test_level4/test_exec_${exec} $input | cat -e)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test 225225 "3*3*5*5*7*11*13$"
run_test 8333325 "3*3*5*5*7*11*13*37$"
run_test 9539 "9539$"
run_test 804577 "804577$"
run_test 42 "2*3*7$"
run_test 1 "1$"

result=$(./tests/test_level4/test_exec_${exec} | cat -e)
[ "$result" = "$" ] && echo "✅ Passed for no arguments" || { echo "❌ Failed for no arguments"; fail=1; }

result=$(./tests/test_level4/test_exec_${exec} 42 21 | cat -e)
[ "$result" = "$" ] && echo "✅ Passed for multiple arguments" || { echo "❌ Failed for multiple arguments"; fail=1; }

exit $fail
