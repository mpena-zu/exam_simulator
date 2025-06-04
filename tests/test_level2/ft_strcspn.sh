#!/bin/bash

exec=$1
fail=0

run_test() {
    s="$1"
    reject="$2"

    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\nint main() { printf(\"%zu\", strcspn(\"$s\", \"$reject\")); return 0; }" | gcc -x c -o tmp_ref - && ./tmp_ref)

    result=$(./"$exec" "$s" "$reject")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: s=\"$s\", reject=\"$reject\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: s=\"$s\", reject=\"$reject\""
    fi
}

run_test "hello world" "aeiou"
run_test "abcdef" "xyz"
run_test "123456" "4"
run_test "" "abc"
run_test "abc" ""
run_test "abc" "c"
run_test "test string" " "
run_test "no reject chars" "123"

rm -f tmp_ref

exit $fail
