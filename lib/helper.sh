#!/usr/bin/env bash

echo "sourced helper.sh"

set_default_value() {
  local -n ref=$1
  local default_value=$2

  if [[ -z ${ref+x} ]]; then
    ref="$default_value"
  fi
}

load_module() {
  # local ref=$1
  local module

  if [[ $1 == */* ]]; then
    local ref=$1
  else
    local -n ref=$1
  fi

  if [[ -z "$ref" ]]; then
    echo "no param"
    return
  fi

  for module in $ref; do
    FILE="${module/%.sh/}.sh"
    echo "file: $FILE"

    case "$module" in
    lib/*)
      URL="${SOURCE_URL/%\//}/${FILE}"
      ;;
    */*)
      URL="${SOURCE_URL/%\//}/modules/${FILE}"
      ;;
    *)
      echo "no case"
      ;;
    esac
    echo "url: $URL"

    source <(curl -fsL ${URL})
  done
}
