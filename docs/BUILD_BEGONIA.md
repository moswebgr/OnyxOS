# Build OnyxOS for Redmi Note 8 Pro

Target: Xiaomi Redmi Note 8 Pro (begonia).

OnyxOS uses the Android 14 crDroid base and the available begonia device/kernel/vendor trees. The upstream trees provide hardware integration; OnyxOS adds its product layer.

## Build

Use a Linux x86_64 machine with substantial free storage and RAM. A complete Android checkout can exceed 100 GB.

    export JOBS=$(nproc)
    ./scripts/build_begonia.sh

The build target is onyx_begonia-userdebug. Output is under out/target/product/begonia/.

## Proprietary files

If fresh extraction is required, use the device tree extraction script against compatible stock firmware/device data:

    cd .android/device/redmi/begonia
    ./extract-files.sh

Do not redistribute proprietary Xiaomi firmware or blobs unless permitted.

## Release gate

A successful compilation is not proof of hardware compatibility. Before publishing a release, test boot, display/touch, Wi-Fi, mobile data/calls, Bluetooth, audio, camera, fingerprint, GPS/sensors, charging/USB, encryption/recovery, SELinux enforcing, sleep/wake, reboot and shutdown.
