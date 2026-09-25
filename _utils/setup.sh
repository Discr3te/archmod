#!/usr/bin/env bash

echo "sourced setup.sh"

_loadmodule() {
  local source=$1
  local -n ref=$2

  if [ -z "$ref" ]; then
    echo "no param"
    return
  fi

  for _block in $ref; do
    FILE="${_block/%.sh/}.sh"
    echo "file: $FILE"

    URL="${REMOTE/%\//}/${FILE}"
    echo "url: $URL"

    source <(curl -fsL ${URL})
  done
}
