#!/bin/bash

exec=$1
fail=0

run_test() {
    s="$1"
    accept="$2"

    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\nint main() { printf(\"%zu\", strspn(\"$s\", \"$accept\")); return 0; }" | gcc -x c -o tmp_ref - && ./tmp_ref)

    result=$(./"$exec" "$s" "$accept")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: s=\"$s\", accept=\"$accept\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: s=\"$s\", accept=\"$accept\""
    fi
}

run_test "abc123" "abc"
run_test "abc123" "abcdef"
run_test "123abc" "123"
run_test "" "abc"
run_test "abc" ""
run_test "abcdef" "a"
run_test "aaaaaaaabbbb" "ab"
run_test "42Madrid" "42M"

rm -f tmp_ref
exit $fail
