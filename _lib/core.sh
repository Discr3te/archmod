#!/usr/bin/env bash

# check if we're in an IO redirect or incorrectly sourced script
if [ ! -f "${0}" ]; then
  readonly error="\e[1;31m[X]\e[0m"
  echo -e "$error Running script directly from curl.\
 Save the script and then run it"
  exit
fi
