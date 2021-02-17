#!/usr/bin/env fish

function reduce
    argparse --name=reduce 's-start=?' -- $argv
    set -l curr $_flag_start
    set -l cmd $argv[1]

    if isatty 1
        while read value
            set curr ($cmd $curr $value)
        end
    else
        for value in $argv[2..-1]
            set curr ($cmd $curr $value)
        end
    end
    echo $curr
end