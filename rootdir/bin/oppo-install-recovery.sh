#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0a8a21cc317b768c43e8b061b5468b63498efe22; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:08c2a13c14d0f8e3e572a864862ab9e6d4db2879 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0a8a21cc317b768c43e8b061b5468b63498efe22 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
