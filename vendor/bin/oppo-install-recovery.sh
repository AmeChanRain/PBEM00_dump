#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:412d792d639a2f0999a79811974bee2be4ac4d18; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:822d8ea7f5628ec0f5a20fb184dd41d7b48c270f \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:412d792d639a2f0999a79811974bee2be4ac4d18 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
