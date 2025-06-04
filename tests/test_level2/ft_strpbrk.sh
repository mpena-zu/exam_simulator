#!/bin/bash

exec=$1
fail=0

run_test() {
    s1="$1"
    s2="$2"

    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\nint main() { const char *res = strpbrk(\"$s1\", \"$s2\"); printf(\"%s\", res ? res : \"\"); return 0; }" | gcc -x c -o tmp_ref - 2>/dev/null && ./tmp_ref)

    result=$(./"$exec" "$s1" "$s2")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: s1=\"$s1\", s2=\"$s2\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$result\""
        fail=1
    else
        echo "✅ Passed: s1=\"$s1\", s2=\"$s2\""
    fi
}

run_test "hello" "aeiou"
run_test "abcdef" "xyz"
run_test "abc123" "456"
run_test "" "abc"
run_test "abc" ""
run_test "hello world" "dl"
run_test "42Madrid" "M"
run_test "no match here" "xyz"

rm -f tmp_ref

exit $fail
