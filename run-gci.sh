#!/usr/bin/env bash
#
# Capture and print stdout, since gci doesn't use proper exit codes
# We skip output messages of the format 'skip file <path-to-file> since no import'
# 
#
set -e

exec 5>&1
FILES=$(find . -name '*.go' | grep -v vendor | grep -v infrastructure)
output="$(gci -w $FILES | grep -v "since no import" | tee /dev/fd/5)"
[[ -z "$output" ]]