#!/bin/sh
set -ex

gradle assembleSkipRevenuecatLibraryXCFramework

cd skip-revenuecat/build/XCFrameworks/release/

rm -f SkipRevenuecatLibrary.xcframework.zip
zip -qr SkipRevenuecatLibrary.xcframework.zip SkipRevenuecatLibrary.xcframework
ls -lah SkipRevenuecatLibrary.xcframework.zip
shasum -a 256 SkipRevenuecatLibrary.xcframework.zip
