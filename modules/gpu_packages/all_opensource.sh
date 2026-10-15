#!/usr/bin/env bash

install_all_opensource() {
  local packages=(
    mesa
    xf86-video-amdgpu
    xf86-video-ati
    xf86-video-nouveau
    libva-intel-driver
    intel-media-driver
    vpl-gpu-rt
    libvpl
    vulkan-radeon
    vulkan-intel
    vulkan-nouveau
  )

  install_pkg "${packages[@]}"
}
