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
  local -n ref=$1
  local module

  if [ -z "$ref" ]; then
    echo "no param"
    return
  fi

  for module in $ref; do
    FILE="${module/%.sh/}.sh"
    echo "file: $FILE"

    case "$module" in
    _lib/*)
      URL="${REMOTE/%\//}/${FILE}"
      ;;
    */*)
      URL="${REMOTE/%\//}/_modules/${FILE}"
      ;;
    esac

    source <(curl -fsL ${URL})
  done
}
