#!/bin/bash

SRC="./current_exercise/level1/first_word.c"
EXE="test_exec"

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

run_test "FOR$" "FOR PONY" || fail=1
run_test "this$" "this        ...    is sparta, then again, maybe    not" || fail=1
run_test "$" "   " || fail=1
run_test "$" "a" "b" || fail=1
run_test "lorem,ipsum$" "  lorem,ipsum  " || fail=1

rm -f "$EXE"

exit $fail
