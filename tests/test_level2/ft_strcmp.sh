#!/bin/bash

exec=$1
fail=0

run_test() {
    input1="$1"
    input2="$2"
    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\nint main() { printf(\"%d\", strcmp(\"$input1\", \"$input2\")); return 0; }" | gcc -x c -o tmp_ref -)
    expected_output=$(./tmp_ref)

    result=$(./"$exec" "$input1" "$input2")

    sign() {
        if [ "$1" -lt 0 ]; then
            echo -1
        elif [ "$1" -gt 0 ]; then
            echo 1
        else
            echo 0
        fi
    }

    expected_sign=$(sign "$expected_output")
    result_sign=$(sign "$result")

    if [ "$result_sign" != "$expected_sign" ]; then
        echo "❌ Failed: \"$input1\" vs \"$input2\""
        echo "Expected sign: $expected_sign"
        echo "Got sign     : $result_sign"
        fail=1
    else
        echo "✅ Passed: \"$input1\" vs \"$input2\""
    fi
}

run_test "abc" "abc"
run_test "abc" "abd"
run_test "abc" "ab"
run_test "" ""
run_test "" "a"
run_test "a" ""
run_test "hello" "hello world"
run_test "42" "42"

rm -f tmp_ref

exit $fail
