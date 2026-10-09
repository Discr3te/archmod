#!/usr/bin/env bash

genfstab -U "${MOUNT_PATH}" >>"${MOUNT_PATH}/etc/fstab"
