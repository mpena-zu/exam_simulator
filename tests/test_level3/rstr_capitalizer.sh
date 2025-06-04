#!/bin/bash

exec=rstr_capitalizer
fail=0

run_test() {
    input="$1"
    expected="$2"

    result=$(eval "./tests/test_level3/test_exec_${exec} $input")
    if [ "$result" != "$expected" ]; then
        echo "❌ Failed for input: $input"
        echo "Expected: $expected"
        echo "Got     : $result"
        fail=1
    else
        echo "✅ Passed for input: $input"
    fi
}

run_test "'a FiRSt LiTTlE TESt'" "A firsT littlE tesT"
run_test "'SecONd teST A LITtle BiT   Moar comPLEX'" "seconD tesT A littlE biT   moaR compleX"
run_test "'   But... This iS not THAT COMPLEX'" "   but... thiS iS noT thaT compleX"
run_test "'     Okay, this is the last 1239809147801 but not    the least    t'" "     okay, thiS iS thE lasT 1239809147801 buT noT    thE leasT    T"
run_test "'a b C'" "A B C"
run_test "'D e f'" "D E F"

result=$(./tests/test_level3/test_exec_${exec})
[ "$result" = "" ] && echo "✅ Passed for no arguments" || { echo "❌ Failed for no arguments"; fail=1; }

exit $fail
