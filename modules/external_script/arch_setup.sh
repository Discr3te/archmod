#!/usr/bin/env bash

runuser -l "${USER[name]}" -c 'pwd; touch test.txt; ls -l ~/test.txt' || exit $?

sleep 20
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup.sh)"
