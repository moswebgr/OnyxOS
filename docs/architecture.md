# OnyxOS Architecture

OnyxOS separates a common privacy-focused Android core from device-specific integration.

## Layers

1. **Android base** — AOSP/LineageOS framework and build system.
2. **OnyxOS core** — privacy defaults, Tor integration, network policy, session lifecycle and minimal system configuration.
3. **Device layer** — device tree, kernel integration, vendor configuration and SELinux/device policy.

## Runtime concept

```text
Boot -> network deny state -> Tor bootstrap -> controlled network access -> user session -> reboot -> ephemeral data discarded
```

The exact implementation depends on the selected Android release and kernel/network stack.