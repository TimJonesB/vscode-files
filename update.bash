#!/bin/bash

settings_loc="~/.config/Code/User/settings.json"
keybinds_loc="~/.config/Code/User/keybindings.json"

function main() {
    if [ "$#" -eq 0 ]; then
        echo "No parameters provided. Must provide one parameter."
        return 
    elif [ "$#" -gt 1 ]; then
        echo "Too many parameters. Only accepts one parameter here."
        return
    else
        if [ $1 == "in" ]; then 
            inOp
        elif [ $1 == "out" ]; then
            outOp
        else
            echo "Invalid arg. Only accepts 'in' or 'out'." 
        fi
    fi
}

function inOp() {
    echo "Copying origin's settings.json."
    cp settings.json $settings_loc
}

function outOp() {
    echo "Copying this settings.json to git."
    cp $settings_loc settings.json
}

main "$@"