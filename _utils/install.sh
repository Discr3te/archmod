#!/usr/bin/env bash

echo "sourced install.sh"

# check if we're in an IO redirect or incorrectly sourced script
if [ ! -f "${0}" ]; then
  echo -e "ERROR: Running script directly from curl.\
 Save the script and then run it"
  exit
fi

_loadmodule "common/rank_mirrorlist"
