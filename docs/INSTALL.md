# OnyxOS — Redmi Note 8 Pro

## Current build target

OnyxOS targets the Xiaomi Redmi Note 8 Pro (begonia). The current manifest uses an Android 14 / crDroid 14 base and pulls the device, kernel, vendor, IMS and MediaTek sepolicy repositories required by the device tree.

> Important: OnyxOS is still a source project, not a prebuilt production ROM. A successful build and hardware validation are required before flashing.

## Requirements

Recommended build host:
- 64-bit Linux
- 16+ CPU threads
- 32 GB RAM or more
- 250 GB+ free SSD space
- Git, Python, Java and standard Android build dependencies

## Sync the source

    mkdir -p ~/onyx
    cd ~/onyx
    repo init -u https://github.com/moswebgr/OnyxOS.git -b main
    repo sync -c --force-sync --no-clone-bundle --no-tags -j$(nproc)

## Build

    source build/envsetup.sh
    lunch lineage_begonia-userdebug
    m bacon -j$(nproc)

The exact lunch target may change as the OnyxOS product definitions are introduced. Do not flash a build until the output has been checked for the expected begonia target.

## Output

A successful build normally produces artifacts under:

    out/target/product/begonia/

## Installation — Redmi Note 8 Pro

1. Back up your data. Bootloader unlocking can erase user data.
2. Unlock the bootloader using Xiaomi's official procedure.
3. Verify the device in fastboot:

    fastboot devices
    fastboot getvar product

   The product should identify as begonia.
4. Use a recovery and firmware combination explicitly compatible with the Android base and begonia.
5. From recovery, perform the required factory reset/data format, then sideload the OnyxOS ZIP.
6. For ADB sideload:

    adb sideload <OnyxOS-build.zip>

Do not blindly flash boot, vendor_boot, dtbo, vbmeta, super or other partitions from another ROM/device. Partition layouts and AVB requirements must match the exact build.

## First-boot validation

Test Wi-Fi, mobile data, Bluetooth, calls/SMS, camera, audio, microphone, fingerprint, GPS, charging, sleep/wake, encryption and recovery/OTA behavior.

## Privacy features

The intended architecture includes no Google Mobile Services by default, Tor-first networking, fail-closed network policy, ephemeral/RAM-first sessions, optional encrypted persistence and minimal background services.

These are design goals until implemented and tested in the actual Android system image.

## Development status

The project is currently in source integration / build bring-up. The next milestone is a reproducible userdebug build for begonia, followed by hardware validation and implementation of the OnyxOS privacy, networking and session layers.
