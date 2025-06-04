#!/bin/bash

exec=wdmatch
fail=0

run_test() {
    arg1="$1"
    arg2="$2"
    expected="$3"

    result=$(./tests/test_level2/test_exec_${exec} "$arg1" "$arg2")
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for args: \"$arg1\" \"$arg2\""
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for args: \"$arg1\" \"$arg2\""
    fi
}

run_test "faya" "fgvvfdxcacpolhyghbreda" "faya"
run_test "quarante deux" "qfqfsudf arzgsayns tsregfdgs sjytdekuoixq " "quarante deux"

run_test "faya" "fgvvfdxcacpolhyghbred" ""
run_test "error" "rrerrrfiiljdfxjyuifrrvcoojh" ""

result=$(./tests/test_level2/test_exec_${exec})
[ "$result" = "" ] && echo "✅ Passed for no arguments" || { echo "❌ Failed for no arguments"; fail=1; }

result=$(./tests/test_level2/test_exec_${exec} "onlyonearg")
[ "$result" = "" ] && echo "✅ Passed for one argument" || { echo "❌ Failed for one argument"; fail=1; }

exit $fail
