#!/usr/bin/env bash

runuser -l "${USER[name]}" -c "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Discr3te/arch-setup/refs/heads/main/setup.sh)\"" || exit $?
