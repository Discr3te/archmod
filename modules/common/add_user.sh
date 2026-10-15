#!/usr/bin/env bash
# =============================================================================
# ROOT
# =============================================================================

case "${USER[root,password]}" in
"prompt")
  prompt_password 'USER[root,password]' "password for root"

  chpasswd <<<"root:${USER[root,password]}"
  ;;
"default")
  chpasswd <<<"root:admin"
  ;;
"lock")
  passwd -l root
  ;;
esac

# =============================================================================
# USER
# =============================================================================

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
"prompt")
  prompt_password 'USER[password]' "password for ${USER[name]}"

  chpasswd <<<"${USER[name]}:${USER[password]}"
  ;;
"default")
  # Password will be "mypassword", and will need to be reset after login
  chpasswd <<<"${USER[name]}:mypassword"
  ;;
esac
