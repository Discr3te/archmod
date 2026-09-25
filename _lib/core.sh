#!/usr/bin/env bash

# check if we're in an IO redirect or incorrectly sourced script
if [ ! -f "${0}" ]; then
  echo -e "ERROR: Running script directly from curl.\
 Save the script and then run it"
  exit
fi

echo "_lib/core"
