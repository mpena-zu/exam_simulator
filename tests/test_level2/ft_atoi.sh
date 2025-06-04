#!/bin/bash

SRC="./current_exercise/level2/ft_atoi.c"
EXE="test_exec"

gcc "$SRC" tests/test_level2/test_exec_ft_atoi.c -o "$EXE" 2> compile_errors.txt
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

run_test "0$" "" || fail=1
run_test "42$" "42" || fail=1
run_test "-42$" "-42" || fail=1
run_test "2147483647$" "2147483647" || fail=1
run_test "-2147483648$" "-2147483648" || fail=1
run_test "0$" "   " || fail=1
run_test "123$" "   123" || fail=1
run_test "0$" "abc123" || fail=1
run_test "123$" "123abc" || fail=1
run_test "-123$" "  -123abc" || fail=1
run_test "0$" "+-123" || fail=1

rm -f "$EXE"

exit $fail
