# OnyxOS Threat Model

## Protected goals

- Reduce accidental direct internet connections.
- Reduce DNS and IPv6 leakage.
- Reduce background network access.
- Reduce persistent local session traces.
- Minimize unnecessary telemetry.

## Fail-closed requirement

Before network access is considered available, the system should block traffic. Tor bootstrap should be a prerequisite for normal network use. Unsupported traffic should be blocked rather than silently routed directly.

## Limits

OnyxOS cannot by itself guarantee anonymity against a compromised device, malicious hardware/firmware, compromised applications, or deliberate disabling of security controls.