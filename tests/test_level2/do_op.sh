#!/bin/bash

EXE="$1"

run_test() {
    expected="$1"
    shift
    output=$("$EXE" "$@" | cat -e)
    
    if [ "$output" == "$expected" ]; then
        echo "✅ Passed: $*"
        return 0
    else
        echo "❌ Failed: $*"
        echo "Expected: $expected"
        echo "Got:      $output"
        return 1
    fi
}

fail=0

run_test "56088$" "123" "*" "456" || fail=1
run_test "42$" "9828" "/" "234" || fail=1
run_test "-42$" "1" "+" "-43" || fail=1
run_test "$" || fail=1
run_test "-3$" "3" "-" "6" || fail=1
run_test "0$" "3" "%" "3" || fail=1

exit $fail
