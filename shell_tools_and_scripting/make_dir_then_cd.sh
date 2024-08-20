#!/bin/bash

# NOTE: We make the function take effect by `source <file_name_with_function>` instead of execute the file with `./<file_name_with_function>`

mcd () {
    mkdir -p "$1"
    cd "$1" || exit
}
