#!/usr/bin/env bash

select_disk() {
  if ! command -v fzf &>/dev/null; then
    install_pkg fzf
  fi

  local fzf_opts=(
    --reverse
    --prompt 'Disk: '
    --header 'Select a disk'
    --preview 'lsblk -d -o NAME,SIZE,MODEL /dev/{}'
  )

  lsblk -dno NAME | fzf "${fzf_opts[@]}"
}

validate_disk() {
  if [[ "${DISK[name]}" == "ask" || ! -b "/dev/${DISK[name]}" ]]; then
    DISK[name]=$(select_disk)
  fi
}

create_new_partition_table() {
  local disk_label=$1
  local sfdisk_opts=(
    --wipe always
    --wipe-partitions always
  )

  case $disk_label in
  "gpt")
    sfdisk "${sfdisk_opts[@]}" /dev/"${DISK[name]}" <<EOF
    label: gpt
EOF
    ;;
  "mbr")
    : # come back and implement
    ;;
  esac
}

partition() {
  if [[ "${DISK[name]}" =~ [0-9]$ ]]; then
    printf "%s" "${DISK[name]}p$1"
  else
    printf "%s" "${DISK[name]}$1"
  fi
}

add_partition() {
  local -n partition=$1
  local name=$2
  local size=$3
  local type=$4

  local partition_info

  [[ $size == "100%" ]] && size=+ # sfdisk uses '+' for 100%

  partition_info=(
    "/dev/$partition:"
    "name=$name,"
    "size=$size,"
    "type=$type"
  )

  sfdisk --append "/dev/${DISK[name]}" <<<"${partition_info[*]}"
}
