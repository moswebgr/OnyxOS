#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_ROOT="${ANDROID_ROOT:-$ROOT/.android}"

if ! command -v repo >/dev/null 2>&1; then
  echo "repo is required. Install Google's repo tool first." >&2
  exit 1
fi

mkdir -p "$ANDROID_ROOT"

if [ ! -d "$ANDROID_ROOT/.repo" ]; then
  cd "$ANDROID_ROOT"
  repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs --no-clone-bundle
else
  cd "$ANDROID_ROOT"
fi

mkdir -p "$ANDROID_ROOT/.repo/local_manifests"
cp "$ROOT/manifest/onyx.xml" "$ANDROID_ROOT/.repo/local_manifests/onyx.xml"

repo sync -c --force-sync --no-clone-bundle -j"${JOBS:-4}"

rm -rf "$ANDROID_ROOT/device/onyx/begonia"
mkdir -p "$ANDROID_ROOT/device/onyx"
cp -a "$ROOT/onyx/device/begonia" "$ANDROID_ROOT/device/onyx/"

echo "Preparation complete."
echo "Run: source build/envsetup.sh && lunch onyx_begonia-userdebug"
echo "Then: m otapackage -j$(nproc)"
