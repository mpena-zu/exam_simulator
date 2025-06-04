#!/bin/bash

exec_bin="$1"
fail=0

run_test() {
    local input="$1"
    local expected="$2"
    local output

    if [ -z "$input" ]; then
        output=$($exec_bin "")
    else
        output=$($exec_bin "$input")
    fi

    if [ "$output" = "$expected" ]; then
        echo "✅ Passed for input: \"$input\""
    else
        echo "❌ Failed for input: \"$input\""
        echo "Expected: \"$expected\""
        echo "Got     : \"$output\""
        fail=1
    fi
}

run_test "vous   voyez   c'est   facile   d'afficher   la   meme   chose" "vous   voyez   c'est   facile   d'afficher   la   meme   chose"
run_test " seulement          la c'est      plus dur " "seulement   la   c'est   plus   dur"

output=$($exec_bin "comme c'est cocasse" "vous avez entendu, Mathilde ?")
if [ "$output" = "" ]; then
    echo "✅ Passed for multiple arguments (no 1 argument)"
else
    echo "❌ Failed for multiple arguments"
    echo "Expected: \"\""
    echo "Got     : \"$output\""
    fail=1
fi

if [ $fail -eq 1 ]; then
    echo "❌ Exercise failed. Try again."
    exit 1
else
    echo "🎉 Exercise passed!"
    exit 0
fi
