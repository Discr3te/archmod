#!/usr/bin/env bash

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
  local param1=$1
  local module

  for module in $param1; do
    FILE="${module/%.sh/}.sh"

    case "$module" in
    */)
      echo "no param"
      return
      ;;
    lib/*)
      URL="${SOURCE_URL/%\//}/${FILE}"
      ;;
    */*)
      URL="${SOURCE_URL/%\//}/modules/${FILE}"
      ;;
    *)
      echo "module: $module"
      echo "no case"
      sleep 10
      ;;
    esac

    source <(curl -fsSL ${URL})
  done
}

install_pkg() {
  pacman -Sy --noconfirm --needed "$@"
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
