#!/usr/bin/env bash

echo "sourced setup.sh"

_loadmodule() {
  echo "loadmodule"
  if [ -z "$@" ]; then
    return
  fi

  echo "loadmodule"

  for _block in $@; do
    echo "loadmodule"
    FILE="${_block/%.sh/}.sh"
    echo "loadmodule"
    URL="${REMOTE/%\//}/_modules/${FILE}"
    echo "loadmodule"

    source <(curl -fsL ${URL})
    echo "loadmodule"
  done
}
