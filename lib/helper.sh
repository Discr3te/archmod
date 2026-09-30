#!/usr/bin/env bash

echo "sourced helper.sh"

log_message() {
  local log_level="$1"
  local message="$2"
  local timestamp

  case "$log_level" in
  "1")
    log_level="FATAL"
    ;;
  "2")
    log_level="ERROR"
    ;;
  "3")
    log_level="WARNING"
    ;;
  "4")
    log_level="INFO"
    ;;
  *)
    ;;
  esac

  printf -v timestamp "%(%Y-%m-%d %H:%M:%S)T" -1

  printf "[%s] [%s] %s\n" "$timestamp" "$log_level" "$message" >>"${LOGGING[file]}"
}

default_value() {
  local -n ref=$1

  if [[ -z ${ref:+x} ]]; then
    ref="$2"
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
