#!/bin/bash
# Build script for Codemagic

set -e

echo "Installing dependencies..."
npm install

echo "Installing Capacitor CLI..."
npm install -D @capacitor/core @capacitor/cli @capacitor/android

echo "Checking Android directory..."
if [ ! -d "android" ]; then
  echo "Creating Android project..."
  npx cap init "Sheckless Counter" com.sheckless.counter --web-dir public
  npx cap add android
else
  echo "Android project already exists"
fi

echo "Syncing web files..."
npx cap sync android

echo "Building APK..."
cd android

# Make gradlew executable
chmod +x gradlew

# Build debug APK
echo "Building debug APK..."
./gradlew assembleDebug

# Build release APK (optional - requires keystore)
echo "Building release APK..."
./gradlew assembleRelease || echo "Release build skipped (may require keystore configuration)"

echo "Build complete!"
