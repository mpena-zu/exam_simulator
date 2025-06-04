#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"
EXE="$SCRIPT_DIR/../../current_exercise/level1/search_and_replace"

gcc "$EXE.c" -o search_and_replace_test_exec || { echo "❌ Compilation failed"; exit 1; }

run_test() {
    expected="$1"
    shift
    output=$(./search_and_replace_test_exec "$@" | cat -e)

    if [ "$output" == "$expected" ]; then
        echo "✅ Passed: $*"
        return 0
    else
        echo "❌ Failed: $*"
        echo "Expected: $expected"
        echo "Got:      $output"
        return 1
    fi
}

fail=0

run_test "Popoche est un sobre$" "Papache est un sabre" "a" "o" || fail=1
run_test "$" "zaz" "art" "zul" || fail=1
run_test "zaz$" "zaz" "r" "u" || fail=1
run_test "$" "jacob" "a" "b" "c" "e" || fail=1
run_test "ZaZ eT David aiME le METal.$" "ZoZ eT Dovid oiME le METol." "o" "a" || fail=1
run_test "eNcOre Un ExEmPle Pas Facile a Ecrire $" "wNcOre Un ExEmPle Pas Facilw a Ecrirw " "w" "e" || fail=1

rm -f search_and_replace_test_exec

exit $fail
