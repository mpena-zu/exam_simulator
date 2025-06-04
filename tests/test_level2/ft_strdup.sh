#!/bin/bash

exec=$1
fail=0

run_test() {
    src="$1"

    expected=$(echo -e "#include <stdio.h>\n#include <string.h>\n#include <stdlib.h>\nint main() { char *dup = strdup(\"$src\"); if (dup) { printf(\"%s\", dup); free(dup); } return 0; }" | gcc -x c -o tmp_ref - && ./tmp_ref)

    result=$(./"$exec" "$src")

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: src=\"$src\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: src=\"$src\""
    fi
}

run_test "Hello, World!"
run_test ""
run_test "42"
run_test "A longer string with spaces and 1234 numbers."
run_test "Special chars !@#$%^&*()_+-=[]{}|;:',.<>/?"
run_test "Another test string"

rm -f tmp_ref

exit $fail
