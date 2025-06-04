#!/bin/bash

exec=$1
fail=0

run_test() {
    input="$1"
    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\nvoid reverse(char *s) { int len = strlen(s); for (int i = 0; i < len / 2; i++) { char tmp = s[i]; s[i] = s[len - i - 1]; s[len - i - 1] = tmp; } }\nint main() { char s[] = \"$input\"; reverse(s); printf(\"%s\", s); return 0; }" | gcc -x c -o tmp_ref - && ./tmp_ref)

    result=$(./"$exec" "$input")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: input=\"$input\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: input=\"$input\""
    fi
}

run_test "hello"
run_test "abc"
run_test ""
run_test "a"
run_test "123456"
run_test "racecar"
run_test "42Madrid"
run_test "   "
run_test "!@#"

rm -f tmp_ref
exit $fail
