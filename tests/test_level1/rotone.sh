#!/bin/bash

EXE="$(dirname "$0")/../../current_exercise/level1/rotone"

gcc "$EXE.c" -o rotone_test_exec || { echo "❌ Compilation failed"; exit 1; }

run_test() {
    expected="$1"
    shift
    output=$(./rotone_test_exec "$@" | cat -e)

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

run_test "bcd$" "abc" || fail=1
run_test "Mft tubhjbjsft ev tubgg of tfoufou qbt upvkpvst usft cpo.$" "Les stagiaires du staff ne sentent pas toujours tres bon." || fail=1
run_test "BlkiA aMLJKa , 23z $" "AkjhZ zLKIJz , 23y " || fail=1
run_test "$" || fail=1  
run_test "$" "" || fail=1

rm -f rotone_test_exec

exit $fail
