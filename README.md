# functional programming for shell scripts

This tool aims to provide functional programming basics like map, reduce, fold, zip etc for shells

Example: `du * | cut -f 1 | reduce (lambda x y : 'math $y + $x')` here we sum over all file sizes using a lambda and the reduce function.


## install
### fish:
include `set -ax fish_function_path /path/to/this/repo/src/fish` somewhere in your fish init

## Available functions:
`<list>` can is always a list of zero or more arguments


### map 
Usage: `map CMD <list>`

call `FUNCTION $ARG` for each arg supplied

### coalesce
Usage: `coalesce <list>`

prints first non null argument

### reduce
Usage: `reduce CMD [--start=<value>] <list>`

Reduce the list: `x0 = start || ""` and `x_n+1 = (CMD $x_n $arg_n)`

### zip
Usage `zip [--cmd=CMD] <list> [ -- <list> [ -- <list> [...]]]`

`CMD` defaults to `echo`

Returns `CMD $list1_i $list2_i ...` for each entry in the lists. If the list is empty the argument will be an empty string

### lambda
Usage: `lambda <arg1> <arg2> ... : <body>`

Examples: 
```
# create lambda function and save reference to it
set add (lambda x y : 'math $y + $x')
# call it
$add 1 2
# use it
reduce $add (seq 10)
# immediate usage
reduce (lambda x y : 'math $y + $x') (seq 10)
```

### curry
Usage: `curry cmd <list>`

[curries](https://en.wikipedia.org/wiki/Currying) `cmd` with `list`. 