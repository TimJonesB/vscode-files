#!/bin/bash

settings_loc="$HOME/.config/Code/User/settings.json"
keybinds_loc="$HOME/.config/Code/User/keybindings.json"

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
    echo "Copying origin's settings.json and keybindings.json"
    cp settings.json $settings_loc
    cp keybindings.json $keybindings_loc
}

function outOp() {
    echo "Copying this settings.json and keybindings.json to git."
    cp $settings_loc settings.json
    cp $keybinds_loc keybindings.json
}

main "$@"