# OnyxOS Tor Integration

Tor is intended to be the primary network transport.

1. Start Tor early in boot.
2. Keep network access blocked during bootstrap.
3. Verify Tor readiness.
4. Enable the controlled application path.
5. Keep bypass paths blocked.
6. Clean up session state on shutdown.

Tor does not provide arbitrary UDP transport; unsupported UDP should fail rather than use a direct connection.