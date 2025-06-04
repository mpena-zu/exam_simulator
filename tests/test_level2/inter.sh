#!/bin/bash

exec=current_exercise/level2/inter
fail=0

# Compilar antes de ejecutar
gcc -Wall -Wextra -Werror -o "$exec" current_exercise/level2/inter.c
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed"
    exit 1
fi

run_test() {
    input1="$1"
    input2="$2"
    expected="$3"

    result=$("$exec" "$input1" "$input2" | cat -e)

    if [ "$result" != "$expected" ]; then
        echo "❌ Failed: \"$input1\" \"$input2\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed: \"$input1\" \"$input2\""
    fi
}

run_test "padinton" "paqefwtdjetyiytjneytjoeyjnejeyj" "padinto$"
run_test "ddf6vewg64f" "gtwthgdwthdwfteewhrtag6h4ffdhsd" "df6ewg4$"
run_test "rien" "cette phrase ne cache rien" "rien$"

result=$("$exec" | cat -e)
if [ "$result" != "$" ]; then
    echo "❌ Failed: no args"
    echo "Expected: \$"
    echo "Got     : $result"
    fail=1
else
    echo "✅ Passed: no args"
fi

exit $fail
