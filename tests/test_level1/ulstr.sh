#!/bin/bash

EXE=../../current_exercise/level1/ulstr

gcc "$EXE.c" -o ulstr_test_exec || { echo "❌ Compilation failed"; exit 1; }

run_test() {
    expected="$1"
    shift
    output=$(./ulstr_test_exec "$@" | cat -e)

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

run_test "l'EspRIT Ne PEuT PLuS PrOGrESsER S'iL STAgNE ET Si PErSiStENT vaNiTE ET AUTO-JUSTIFICATION.$" "L'eSPrit nE peUt plUs pRogResSer s'Il staGne et sI peRsIsTent VAnIte et auto-justification."
run_test "s'ENtoUrER De SecREt EsT Un SigNe dE MaNqUe dE COnnAIssANcE.  $" "S'enTOuRer dE sECreT eSt uN sIGnE De mAnQuE De coNNaiSSanCe.  "
run_test "3:21 bA  ToUT  MOuN KI kA DI ke M'EN kA FE FOT$" "3:21 Ba  tOut  moUn ki Ka di KE m'en Ka fe fot"
run_test "$"

rm -f ulstr_test_exec

exit $fail
