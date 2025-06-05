#!/bin/bash

PROGRESS_FILE="progress.txt"
CURRENT_EXERCISE_DIR="current_exercise"
SCORE_FILE="score.txt"
ALL_LEVELS_DIR="all_levels"

init_progress() {
    if [ -f "$PROGRESS_FILE" ]; then
        IFS=":" read -r CURRENT_LEVEL CURRENT_EXERCISE < "$PROGRESS_FILE"
    else
        CURRENT_LEVEL="level1"
        CURRENT_EXERCISE=""
    fi
}

prepare_exercise() {
    local level_path="$CURRENT_EXERCISE_DIR/$CURRENT_LEVEL"
    local source_level_path="$ALL_LEVELS_DIR/$CURRENT_LEVEL"

    if [ -z "$CURRENT_EXERCISE" ]; then
        CURRENT_EXERCISE=$(ls "$source_level_path" | shuf -n 1)
    fi

    mkdir -p "$level_path"
    rm -f "$level_path"/*

    cp "$source_level_path/$CURRENT_EXERCISE" "$level_path/"

    echo "$CURRENT_LEVEL:$CURRENT_EXERCISE" > "$PROGRESS_FILE"

    echo "🎯 New exercise selected: ${CURRENT_EXERCISE%.txt}"
    echo "📂 Located in: $level_path/"
    echo "📜 Prompt: $level_path/$CURRENT_EXERCISE"
    echo "✍️  Write your solution in: $level_path/${CURRENT_EXERCISE%.txt}.c"

}

run_tests() {
    local dir="$CURRENT_EXERCISE_DIR/$CURRENT_LEVEL"
    local exe="${CURRENT_EXERCISE%.txt}"

    local test_script="tests/test_${CURRENT_LEVEL}/${exe}.sh"
    local test_exec_c="tests/test_${CURRENT_LEVEL}/test_exec_${exe}.c"
    local test_exec_bin="tests/test_${CURRENT_LEVEL}/test_exec_${exe}"

    if [ ! -f "$dir/$exe.c" ]; then
        echo "⚠️ Solution file $dir/$exe.c not found."
        return 1
    fi

    echo "Compiling solution..."

    if [ -f "$test_exec_c" ]; then
        gcc -I"$dir" "$dir/$exe.c" "$test_exec_c" -o "$test_exec_bin" || {
            echo "❌ Compilation failed."
            return 1
        }
        bash "$test_script" "$test_exec_bin"
    else
        gcc "$dir/$exe.c" -o "$test_exec_bin" || {
            echo "❌ Compilation failed."
            return 1
        }
        bash "$test_script" "$test_exec_bin"
    fi

    return $?
}

correct_exercise() {
    local dir="$CURRENT_EXERCISE_DIR"

    echo "Checking exercise $CURRENT_EXERCISE in folder $dir/$CURRENT_LEVEL..."

    if run_tests; then
        echo "🎉 Exercise passed!"

        if [ -f "$SCORE_FILE" ]; then
            score=$(cat "$SCORE_FILE")
            score=$((score + 1))
        else
            score=1
        fi
        echo "$score" > "$SCORE_FILE"

        if [[ "$0 $*" == *"level"* ]]; then
            echo "✅ $CURRENT_LEVEL practice completed. Done!"
            finish_all
        else
            local next_level_num=$(( ${CURRENT_LEVEL//[!0-9]/} + 1 ))
            local next_level="level$next_level_num"

            if [ -d "$ALL_LEVELS_DIR/$next_level" ]; then
                CURRENT_LEVEL="$next_level"
                CURRENT_EXERCISE=""
                prepare_exercise
            else
                echo "🏆 Congratulations! You've completed all levels!"
                finish_all
            fi
        fi
    else
        echo "❌ Exercise failed. Try again."
        exit 1
    fi
}

finish_all() {
    echo "Finalizing and cleaning up..."

    if [ -f "$SCORE_FILE" ]; then
        score=$(cat "$SCORE_FILE")
        echo "Your final score: $score exercises passed."
    else
        echo "No score data found."
    fi

    rm -f "$PROGRESS_FILE"
    rm -f "$SCORE_FILE"
    rm -rf "$CURRENT_EXERCISE_DIR"

    find tests/test_level* -type f \( -name 'test_exec_*' -a ! -name '*.c' -a ! -name '*.sh' \) -exec rm -f {} +

    echo "🏁 All done! Your progress has been reset."
    echo "⭐ Thanks for practicing! Good luck!"

    exit 0
}

init_progress

case "$1" in
    start)
        prepare_exercise
        ;;
    correct)
        correct_exercise
        ;;
    finish)
        finish_all
        ;;
    level1|level2|level3|level4)
        CURRENT_LEVEL="$1"
        CURRENT_EXERCISE=""
        prepare_exercise
        ;;
    *)
        echo "Usage: $0 {start|correct|finish|level1|level2|level3|level4}"
        ;;
esac
