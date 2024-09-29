#!/bin/bash
set -ex

git pull

./scripts/build.sh

LATEST_VERSION=$(git tag -l --sort=-version:refname | grep '[0-9]*\.[0-9]*\.[0-9]*' | head -n 1)
if [ -z "${LATEST_VERSION}" ]; then LATEST_VERSION="0.0.0"; fi

NEW_VERSION=$(semver bump ${SEMVER_BUMP:-patch} ${LATEST_VERSION})

ARTIFACT="skip-revenuecat/build/XCFrameworks/release/SkipRevenuecat.xcframework.zip"

gh release create --notes "$(cat ${ARTIFACT} | shasum -a 256)" ${NEW_VERSION} ${ARTIFACT}

