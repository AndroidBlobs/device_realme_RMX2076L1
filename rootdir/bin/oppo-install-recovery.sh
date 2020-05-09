#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:af4cba853e2bcd5c07a97d7107a1aaf73717cce7; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:e07db3e7839c1449095fde49d4ab2552697a568c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:af4cba853e2bcd5c07a97d7107a1aaf73717cce7 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
