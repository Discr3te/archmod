#!/usr/bin/env bash

echo "sourced helper.sh"

_defaultvalue() {
  local -n ref=$1
  local default_value=$2

  if [[ -z ${ref+x} ]]; then
    ref="$default_value"
  fi
}

_loadmodule() {
  if [ -z "$@" ]; then
    echo "no param"
    return
  fi

  for _block in $@; do
    FILE="${_block/%.sh/}.sh"
    echo "file: $FILE"

    URL="${REMOTE/%\//}/${FILE}"
    echo "url: $URL"

    source <(curl -fsL ${URL})
  done
}
