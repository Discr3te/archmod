#!/usr/bin/env bash

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
