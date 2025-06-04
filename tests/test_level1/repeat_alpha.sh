#!/bin/bash

SRC="./current_exercise/level1/repeat_alpha.c"
EXE="test_repeat_alpha"

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

run_test "abbccc$" "abc" || fail=1
run_test "Alllllllllllleeeeexxxxxxxxxxxxxxxxxxxxxxxx.$" "Alex." || fail=1
run_test "abbacccaddddabba 42!$" "abacadaba 42!" || fail=1
run_test "$" || fail=1
run_test "$" "" || fail=1 

rm -f "$EXE"

exit $fail
