#!/usr/bin/env fish

function curry
    set -l name "curried_"$argv[1]"_"(random 100000 999999)

    eval "function $name; $argv \$argv; end"

    echo $name
end