#!/bin/bash

EXE="$1"

run_test() {
    expected="$1"
    input="$2"

    output=$("$EXE" "$input" | cat -e)
    if [ "$output" == "$expected" ]; then
        echo "✅ Passed: $input"
        return 0
    else
        echo "❌ Failed: $input"
        echo "Expected: $expected"
        echo "Got:      $output"
        return 1
    fi
}

fail=0

run_test "1$" 1 || fail=1      
run_test "1$" 2 || fail=1        
run_test "1$" 1024 || fail=1   
run_test "0$" 0 || fail=1        
run_test "0$" 3 || fail=1
run_test "0$" 123456 || fail=1
run_test "0$" 2147483647 || fail=1
run_test "1$" 1073741824 || fail=1

exit $fail
