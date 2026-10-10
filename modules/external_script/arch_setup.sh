#!/usr/bin/env bash

echo "${USER[name]} ALL=(ALL:ALL) NOPASSWD: ALL" >"$SUDOERS_TMP"
chmod 440 "$SUDOERS_TMP"
trap 'rm -f "$SUDOERS_TMP"' EXIT

runuser -l "${USER[name]}" -c "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Discr3te/arch-setup/refs/heads/main/setup.sh)\"" || exit $?
