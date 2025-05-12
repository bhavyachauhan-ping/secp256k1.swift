#!/bin/bash

TARGET_SCHEME="$1"

echo "############################################################################################"
echo "######################### Building xcframework for $TARGET_SCHEME #########################"
echo "############################################################################################"

# Remove previous builds
echo "Removing previous builds"
rm -rf archives/
rm build_errors.log
rm -rf *.xcframework
rm -rf library/$TARGET_SCHEME.xcframework

ROOT_DIR=`pwd`

IOS_ARCHIVE="archives/$TARGET_SCHEME"
TARGET_IOS_FRAMEWORK="$IOS_ARCHIVE.xcarchive/Products/Library/Frameworks/$TARGET_SCHEME.framework"

IOS_SIMULATOR_ARCHIVE="archives/$TARGET_SCHEME-simulator"
TARGET_IOS_SIMULATOR_FRAMEWORK="$IOS_SIMULATOR_ARCHIVE.xcarchive/Products/Library/Frameworks/$TARGET_SCHEME.framework"


echo "======================================================================================================================================================"
echo "========================================================= Archiving for iOS =========================================================================="
echo "======================================================================================================================================================"

xcodebuild archive -project secp256k1Swift.xcodeproj -scheme $TARGET_SCHEME -destination "generic/platform=iOS" -archivePath "$IOS_ARCHIVE" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | tee build_errors.log | xcpretty

echo "======================================================================================================================================================"
echo "==================================================== Archiving for iOS Simulator ====================================================================="
echo "======================================================================================================================================================"

xcodebuild archive -project secp256k1Swift.xcodeproj -scheme $TARGET_SCHEME -destination "generic/platform=iOS simulator" -archivePath "$IOS_SIMULATOR_ARCHIVE" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | tee build_errors.log | xcpretty

echo "======================================================================================================================================================"
echo "===============================================# Building $TARGET_SCHEME.XCFramework ============================================================"
echo "======================================================================================================================================================"
xcodebuild -create-xcframework -framework "$TARGET_IOS_FRAMEWORK" \
							   -framework "$TARGET_IOS_SIMULATOR_FRAMEWORK" \
							   -output $TARGET_SCHEME.xcframework
mkdir library
mv $TARGET_SCHEME.xcframework library/
echo "Done. You can find $TARGET_SCHEME.xcframework under library"