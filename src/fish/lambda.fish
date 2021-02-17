#!/usr/bin/env fish

function lambda
    set -l name 'lambda_'(random 100000 999999)
    set -l args
    set -l body
    set -l argsdone ""
    for x in $argv
        if test -n "$argsdone"
            set -a body "$x"
        else if test "$x" = ':'
            set argsdone "yep"
        else
            set -a args "set $x \$argv["(math (count $args) + 1)"]"
        end
    end

    eval "function $name;" (echo $args";" $body | string collect)"; end"

    echo $name
end
