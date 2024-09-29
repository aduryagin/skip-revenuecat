#!/bin/bash
set -ex

git pull

./scripts/build.sh

# Get the latest tag, default to 0.0.0 if no tag exists
LATEST_VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")

# Split the version into an array
IFS='.' read -r -a VERSION_PARTS <<< "$LATEST_VERSION"

# Decide what part to bump (major, minor, patch)
BUMP=${1:-patch}

case $BUMP in
  major)
    NEW_VERSION="$((VERSION_PARTS[0] + 1)).0.0"
    ;;
  minor)
    NEW_VERSION="${VERSION_PARTS[0]}.$((VERSION_PARTS[1] + 1)).0"
    ;;
  patch)
    NEW_VERSION="${VERSION_PARTS[0]}.${VERSION_PARTS[1]}.$((VERSION_PARTS[2] + 1))"
    ;;
  *)
    echo "Unknown bump type: $BUMP"
    exit 1
    ;;
esac

# Output the new version
echo "New version: $NEW_VERSION"

ARTIFACT="skip-revenuecat/build/XCFrameworks/release/SkipRevenuecat.xcframework.zip"

gh release create --notes "$(cat ${ARTIFACT} | shasum -a 256)" ${NEW_VERSION} ${ARTIFACT}

