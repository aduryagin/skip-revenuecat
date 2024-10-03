#!/bin/sh
set -ex

gradle assembleSkipRevenueCatLibraryXCFramework

cd skip-revenuecat-library/build/XCFrameworks/release/

rm -f SkipRevenueCatLibrary.xcframework.zip
zip -qr SkipRevenueCatLibrary.xcframework.zip SkipRevenueCatLibrary.xcframework
ls -lah SkipRevenueCatLibrary.xcframework.zip
shasum -a 256 SkipRevenueCatLibrary.xcframework.zip
