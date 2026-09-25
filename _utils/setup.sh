#!/usr/bin/env bash

echo "sourced setup.sh"

_loadmodule() {
  if [ -z "$@" ]; then
    echo "no param"
    return
  else
    echo "yes param"
  fi

  for _block in $@; do
    FILE="${_block/%.sh/}.sh"
    echo "file: $FILE"
    URL="${REMOTE/%\//}/_modules/${FILE}"
    echo "url: $URL"

    source <(curl -fsL ${URL})
  done
}
