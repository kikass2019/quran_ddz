#!/bin/bash
set -e

echo "🕌 Quran Data App - Build Script"
echo "================================="

# Clean
echo "🧹 Cleaning..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build APK
echo "📱 Building Android APK..."
flutter build apk --release

# Build App Bundle
echo "📦 Building Android App Bundle..."
flutter build appbundle --release

echo ""
echo "✅ Build complete!"
echo "📁 APK: build/app/outputs/flutter-apk/app-release.apk"
echo "📁 AAB: build/app/outputs/bundle/release/app-release.aab"
