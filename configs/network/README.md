# OnyxOS Network Policy

Target model: fail-closed.

- Block direct DNS.
- Block direct IPv6 paths unless explicitly handled by the Tor design.
- Block direct TCP/UDP paths that bypass the Tor gateway.
- Do not expose unsupported UDP directly.
- Start networking in a deny state.
- Permit application traffic only after the Tor path is ready.

The final enforcement mechanism must be validated on the selected Android/kernel stack.