#!/usr/bin/env fish

function map 
    for c in $argv[2..-1]
        $argv[1] $c
    end
end