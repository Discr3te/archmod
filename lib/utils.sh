#!/usr/bin/env bash

default_value() {
  local -n ref=$1

  if [[ -z ${ref:+x} ]]; then
    ref="$2"
  fi
}

load_module() {
  [[ -z $1 ]] && return

  local module="${1%%/*}"
  local script="${1#*/}"
  local i

  for i in $script; do
    FILE="$module/${i/%.sh/}.sh"

    case "$module" in
    "lib")
      URL="${SOURCE_URL/%\//}/${FILE}"
      ;;
    *)
      URL="${SOURCE_URL/%\//}/modules/${FILE}"
      ;;
    esac

    source <(curl -fsSL ${URL})
  done
}

install_pkg() {
  pacman -S --noconfirm --needed "$@"
}

uncomment() {
  local valuename="$1"
  local filepath="$2"
  sed -i "s/^#[[:space:]]*\(${valuename}.*\)$/\1/" "${filepath}"
}

prompt_password() {
  local -n password_ref=$1
  local label=$2
  local password password_confirm

  clear
  while true; do
    read -rsp "Enter ${label}: " password
    echo
    if [[ -z $password ]]; then
      clear
      echo "Password cannot be empty, please try again..." >&2
    else
      read -rsp "Confirm ${label}: " password_confirm
      echo
      if [[ $password == "$password_confirm" ]]; then
        password_ref=$password
        return 0
      else
        clear
        echo "Passwords do not match, please try again..." >&2
      fi
    fi
  done
}
