#!/usr/bin/env bash

# Creating the user and adding the groups
case "${USER[sudo,enable]}" in
"true")
  install_pkg sudo
  uncomment "%wheel ALL=(ALL:ALL) ALL" "/etc/sudoers"

  if [[ -z ${USER[group]} ]]; then
    useradd -m -G wheel "${USER[name]}"
  else
    useradd -m -G "wheel,${USER[group]}" "${USER[name]}"
  fi
  ;;
"false")
  if [[ -z ${USER[group]} ]]; then
    useradd -m "${USER[name]}"
  else
    useradd -m -G "${USER[group]}" "${USER[name]}"
  fi
  ;;
esac

# Setting the password for the user
case "${USER[password]}" in
"ask")
  prompt_password 'USER[password]' "password for ${USER[name]}"

  chpasswd <<EOF
${USER[name]}:${USER[password]}
EOF
  ;;
"default")
  # Password will be "mypassword", and will need to be reset after login
  chpasswd <<EOF
${USER[name]}:mypassword 
EOF
  ;;
esac
