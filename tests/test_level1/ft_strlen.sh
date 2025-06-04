#!/bin/bash

BINARY="$1"

"$BINARY" "" | grep -q "^0$" || exit 1
"$BINARY" "a" | grep -q "^1$" || exit 1
"$BINARY" "Hello" | grep -q "^5$" || exit 1
"$BINARY" "42" | grep -q "^2$" || exit 1
"$BINARY" "This is a longer test" | grep -q "^22$" || exit 1
"$BINARY" "   " | grep -q "^3$" || exit 1
"$BINARY" "!@#$%^&*()" | grep -q "^10$" || exit 1

echo "✅ All tests passed for ft_strlen!"
exit 0
