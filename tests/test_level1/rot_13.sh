#!/bin/bash

SRC="./current_exercise/level1/rot_13.c"
EXE="test_exec_rot_13"

gcc "$SRC" -o "$EXE" 2> compile_errors.txt
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed:"
    cat compile_errors.txt
    rm -f compile_errors.txt
    exit 1
fi
rm -f compile_errors.txt

run_test() {
    expected="$1"
    shift
    output=$("./$EXE" "$@" | cat -e)

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

run_test "nop$" "abc" || fail=1
run_test "Zl ubefr vf Nznmvat.$" "My horse is Amazing." || fail=1
run_test "NxwuM mYXVWm , 23l $" "AkjhZ zLKIJz , 23y " || fail=1
run_test "$" || fail=1          
run_test "$" "" || fail=1       
run_test "$" "one" "two" || fail=1 

rm -f "$EXE"

exit $fail
