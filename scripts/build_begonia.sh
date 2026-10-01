#!/usr/bin/env bash
set -euo pipefail

DEVICE="begonia"

source build/envsetup.sh
lunch lineage_${DEVICE}-userdebug
m bacon -j"$(nproc)"

echo
echo "Build complete."
echo "Artifacts: out/target/product/${DEVICE}/"
