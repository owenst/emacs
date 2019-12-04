#!/bin/bash

# Deduplicate path variables
#echo "Removing duplicates from"

get_var () {
    eval 'printf "%s\n" "${'"$1"'}"'
}
set_var () {
    eval "$1=\"\$2\""
}
dedup_var () {
    pathvar_name="$1"
    echo "Removing duplicates from" $pathvar_name
    echo "Before:"
    get_var "$pathvar_name"
    pathvar_value="$(get_var "$pathvar_name")"
    deduped_path="$(perl -e 'print join(":",grep { not $seen{$_}++ } split(/:/, $ARGV[0]))' "$pathvar_value")"
    set_var "$pathvar_name" "$deduped_path"
    echo "After:"
    get_var "$pathvar_name"
}

if [ $# -eq 0 ]
then
    printf "Usage:\n"
    echo "  $0 ENVIRONMENT_VARIABLE_NAME"
    echo "E.g.:"
    echo "  $0 PATH"
    printf "\n\nDEFAULT:\n"
    dedup_var PATH
else
    dedup_var $1
fi
