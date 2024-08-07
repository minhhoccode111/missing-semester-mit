#!/bin/bash

mcd () {
    mkdir -p "$1"
    cd "$1" || exit
}

mcd "$1"
