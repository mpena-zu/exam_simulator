#!/bin/bash

FILE="current_exercise/level3/hidenp.c"
EXEC="hidenp"

gcc -Wall -Wextra -Werror "$FILE" -o "$EXEC"
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

test_program() {
    input=("$@")
    len=${#input[@]}

    if [ $len -eq 0 ]; then
        output=$(./$EXEC)
        expected=""
    else
        expected="${input[$((len-1))]}"
        unset 'input[$((len-1))]'
        output=$(./$EXEC "${input[@]}")
    fi

    if [ "$output" = "$expected" ]; then
        echo "✅ Test passed for input: ${input[*]}"
    else
        echo "❌ Test FAILED for input: ${input[*]}"
        echo "   Expected: '$expected'"
        echo "   Got:      '$output'"
        failed=1
    fi
}

failed=0

test_program "fgex.;" "tyf34gdgf;'ektufjhgdgex.;.;rtjynur6" "1"
test_program "abc" "2altrb53c.sse" "1"
test_program "abc" "btarc" "0"
test_program "" "" "1"
test_program "abc" "" "0"
test_program 

if [ $failed -eq 0 ]; then
    echo "✅ All tests passed."
else
    echo "❌ Some tests failed."
fi

exit $failed
