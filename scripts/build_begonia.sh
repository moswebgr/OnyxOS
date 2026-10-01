#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_ROOT="${ANDROID_ROOT:-$ROOT/.android}"

"$ROOT/scripts/prepare_onyx.sh"
cd "$ANDROID_ROOT"
source build/envsetup.sh
lunch onyx_begonia-userdebug
m otapackage -j"${JOBS:-$(nproc)}"

echo "Build output: $ANDROID_ROOT/out/target/product/begonia/"
