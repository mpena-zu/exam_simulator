#!/bin/bash

exec=add_prime_sum
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(./tests/test_level3/test_exec_${exec} $input)
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test 0 "0"
run_test 1 "0"
run_test 2 "2"
run_test 3 "5"
run_test 4 "5"
run_test 5 "10"
run_test 6 "10"
run_test 7 "17"
run_test 10 "17"
run_test 11 "28"

result=$(./tests/test_level3/test_exec_${exec})
[ "$result" = "0" ] && echo "✅ Passed for no arguments" || { echo "❌ Failed for no arguments"; fail=1; }

result=$(./tests/test_level3/test_exec_${exec} -5)
[ "$result" = "0" ] && echo "✅ Passed for negative input" || { echo "❌ Failed for negative input"; fail=1; }

result=$(./tests/test_level3/test_exec_${exec} abc)
[ "$result" = "0" ] && echo "✅ Passed for non-numeric input" || { echo "❌ Failed for non-numeric input"; fail=1; }

exit $fail
