#!/usr/bin/env bash

DEV_SETUP_URL="https://raw.githubusercontent.com/Discr3te/arch-setup/refs/heads/main/setup.sh"
SUDOERS_TMP="/etc/sudoers.d/99-archmod-temp"

echo "${USER[name]} ALL=(ALL:ALL) NOPASSWD: ALL" >"$SUDOERS_TMP"
chmod 440 "$SUDOERS_TMP"
trap 'rm -f "$SUDOERS_TMP"' EXIT

runuser -l "${USER[name]}" -c "pwd; sleep 10; /bin/bash -c \"\$(curl -fsSL $DEV_SETUP_URL)\"" ||
  exit $?

rm -f "$SUDOERS_TMP"
