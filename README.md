# OnyxOS

OnyxOS is an Android-based privacy-focused operating system project targeting older Android hardware, starting with the Xiaomi Redmi Note 8 Pro (begonia).

## Goals

- Real bootable Android ROM based on AOSP/LineageOS components.
- Tor-only networking with fail-closed direct networking.
- No Google Mobile Services by default.
- Ephemeral/RAM-first sessions with optional encrypted persistence.
- Read-only system image where practical.
- Minimal userspace and services.
- Emulator-first development for networking, UI and session logic.
- Device-specific support separated from the common OnyxOS core.

## Initial target

- Device: Xiaomi Redmi Note 8 Pro
- Codename: begonia
- Architecture: ARM64

## Repository status

This repository contains the OnyxOS project layer, an Android 14 / begonia manifest, and a reproducible build path. The full Android source tree is synchronized separately; proprietary device blobs are not redistributed here.

The Android source should be synced separately using the manifest under `manifest/`.

## Development stages

1. Sync the Android 14 base and begonia hardware trees.
2. Build the onyx_begonia-userdebug target.
3. Implement and test the network fail-closed/Tor path.
4. Implement ephemeral session behavior.
5. Build a real begonia image.
6. Validate Wi-Fi, mobile data, Bluetooth, camera, audio, sensors and fingerprint on hardware.

Hardware functionality is unverified until tested on a real device.

## Security note

“Tor-only” is a design target, not a claim that the current repository already enforces it system-wide. The implementation must be tested against DNS, IPv6, direct TCP/UDP, captive portals, background services and startup races.

## License

The OnyxOS project layer will use Apache-2.0. Upstream Android, LineageOS, Linux kernel, firmware and device/vendor components retain their respective licenses.
