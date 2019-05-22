#!/usr/bin/env bash

if [[ -z "$TARGET_FILE" ]]; then
    echo 'TARGET_FILE not defined.'
    exit 1
fi

if [[ -z "$SEARCH_KEY" ]]; then
    echo 'SEARCH_KEY not defined.'
    exit 1
fi
value="_VALUE"
secret_value="$SEARCH_KEY$value"
SECRET="$(echo ${!secret_value})"

if [[ -z "$SECRET" ]]; then
    echo 'SEARCH_KEY_VALUE not defined.'
    exit 1
fi

secret_containing_file="$GITHUB_WORKSPACE/$TARGET_FILE"

sed -i "s/$SEARCH_KEY/$SECRET/" $secret_containing_file