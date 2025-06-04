#!/bin/bash

SRC="./current_exercise/level1/fizzbuzz.c"
EXE="./current_exercise/level1/fizzbuzz"

gcc -Wall -Wextra -Werror "$SRC" -o "$EXE" || { echo "❌ Compilation failed"; exit 1; }

expected_output=$(seq 1 100 | while read -r n; do
    if (( n % 15 == 0 )); then
        echo "fizzbuzz"
    elif (( n % 3 == 0 )); then
        echo "fizz"
    elif (( n % 5 == 0 )); then
        echo "buzz"
    else
        echo "$n"
    fi
done)

actual_output=$("$EXE")

if [ "$actual_output" == "$expected_output" ]; then
    echo "✅ fizz_buzz passed!"
    exit 0
else
    echo "❌ fizz_buzz failed."
    diff <(echo "$expected_output") <(echo "$actual_output")
    exit 1
fi
