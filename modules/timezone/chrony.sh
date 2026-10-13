#!/usr/bin/env bash

ln -sf "/usr/share/zoneinfo/${TIMEZONE[zone]}" /etc/localtime
hwclock --systohc

install_pkg chrony

cat >"/etc/chrony.conf" <<EOF
server time.cloudflare.com iburst nts auto_offline
server ohio.time.system76.com iburst nts auto_offline
server any.time.nl iburst nts auto_offline
server ntp1.wiktel.com iburst nts auto_offline

ntsdumpdir /var/lib/chrony
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
EOF

# auto_offline needs this to bring sources back online (requires NetworkManager)
mkdir -p /etc/NetworkManager/dispatcher.d
cat >/etc/NetworkManager/dispatcher.d/20-chrony <<'EOF'
#!/usr/bin/env bash
chronyc onoffline >/dev/null 2>&1
EOF
chmod 755 /etc/NetworkManager/dispatcher.d/20-chrony

systemctl enable chronyd.service
systemctl disable systemd-timesyncd.service
