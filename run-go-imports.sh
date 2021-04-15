#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e

exec 5>&1
output=$(goimports -w "$(go list -f '{{.Dir}}' ./... | grep -v /vendor/)" | tee /dev/fd/5)
[[ -z "$output" ]]
