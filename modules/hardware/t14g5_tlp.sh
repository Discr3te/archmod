#!/usr/bin/env bash

install_pkg powertop tlp

systemctl enable tlp.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

cat >/etc/tlp.d/laptop_t14g5.conf <<EOF
# /etc/tlp.d/laptop_t14g5.conf — TLP 1.10 drop-in for ThinkPad T14 Gen 5 (AMD)

# Operation and Profiles
TLP_PROFILE_AC=PRF
TLP_PROFILE_BAT=BAL
TLP_PROFILE_DEFAULT=BAL

# Battery Care
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80

# Graphics
AMDGPU_ABM_LEVEL_ON_AC=0
AMDGPU_ABM_LEVEL_ON_BAT=2
AMDGPU_ABM_LEVEL_ON_SAV=3

# Platform
PLATFORM_PROFILE_ON_AC=performance
PLATFORM_PROFILE_ON_BAT=low-power
PLATFORM_PROFILE_ON_SAV=low-power

# Processor
CPU_ENERGY_PERF_POLICY_ON_AC=performance
CPU_ENERGY_PERF_POLICY_ON_BAT=balance_power
CPU_ENERGY_PERF_POLICY_ON_SAV=power

# Radio Device Switching
DEVICES_TO_ENABLE_ON_STARTUP="wifi"
DEVICES_TO_DISABLE_ON_STARTUP="bluetooth nfc wwan"
DEVICES_TO_ENABLE_ON_AC="bluetooth"
DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE="bluetooth nfc wwan"

# Radio Device Wizard
DEVICES_TO_DISABLE_ON_LAN_CONNECT="wifi"
DEVICES_TO_ENABLE_ON_LAN_DISCONNECT="wifi"

# PCIe Autosuspend and ASPM
PCIE_ASPM_ON_AC=default
PCIE_ASPM_ON_BAT=powersupersave
PCIE_ASPM_ON_SAV=powersupersave

# USB Autosuspend
USB_EXCLUDE_BTUSB=1
EOF

sed -i '/^options/{/acpi\.ec_no_wakeup=1/!s/[[:space:]]*$/ acpi.ec_no_wakeup=1/}' /boot/loader/entries/*.conf
