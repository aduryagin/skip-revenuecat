#!/bin/sh
set -ex

gradle assembleSkipRevenuecatXCFramework

cd skip-revenuecat/build/XCFrameworks/release/

rm -f SkipRevenuecat.xcframework.zip
zip -qr SkipRevenuecat.xcframework.zip SkipRevenuecat.xcframework
ls -lah SkipRevenuecat.xcframework.zip
shasum -a 256 SkipRevenuecat.xcframework.zip
