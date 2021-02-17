#!/usr/bin/env fish

function reduce
    argparse --name=reduce 's-start=?' -- $argv
    set -l curr $_flag_start
    set -l cmd $argv[1]
    for value in $argv[2..-1]
        set curr ($cmd $curr $value)
    end
    echo $curr
end