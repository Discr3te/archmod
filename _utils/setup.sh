#!/usr/bin/env bash

echo "sourced setup.sh"

_loadmodule() {
  if [ -z "$@" ]; then
    return
  fi

  for _block in $@; do
    FILE="${_block/%.sh/}.sh"
    URL="${REMOTE/%\//}/_modules/${FILE}"

    source <(curl -fsL ${URL})
  done
}
