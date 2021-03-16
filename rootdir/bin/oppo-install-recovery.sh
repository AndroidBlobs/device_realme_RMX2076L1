#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:ea77d839ee20ba34a0ccc10c6e4763d53cbd1cac; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:8970410f39f553a8ace6aee74282d87659f51573 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:ea77d839ee20ba34a0ccc10c6e4763d53cbd1cac && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
