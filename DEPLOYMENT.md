# Deployment Guide

## 🚀 Deployment Overview

This guide covers deploying the Flashlight Cashier Flutter application to various platforms and environments.

## 📱 Platform Support

### Mobile Platforms

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Modern browsers with Flutter web support

### Desktop Platforms

- **Windows**: Windows 10+
- **macOS**: macOS 10.14+
- **Linux**: Ubuntu 18.04+ (and compatible distributions)

## 🏗️ Build Configuration

### Environment Setup

#### 1. **Development Environment**

```bash
# Flutter SDK
flutter --version
# Flutter 3.8.0 or higher

# Dart SDK
dart --version
# Dart 3.8.0 or higher
```

#### 2. **Build Dependencies**

```bash
# Install dependencies
flutter pub get

# Generate code
flutter packages pub run build_runner build

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Build Types

#### Debug Build

```bash
# Android Debug
flutter build apk --debug

# iOS Debug
flutter build ios --debug

# Web Debug
flutter build web --debug
```

#### Release Build

```bash
# Android Release
flutter build apk --release

# iOS Release
flutter build ios --release

# Web Release
flutter build web --release
```

## 🤖 Android Deployment

### Prerequisites

- Android SDK
- Android Studio
- Java Development Kit (JDK)
- Android device or emulator

### Build Configuration

#### 1. **Update Android Configuration**

```gradle
// android/app/build.gradle
android {
    compileSdkVersion 34
    defaultConfig {
        applicationId "com.flashlight.cashier"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

#### 2. **Signing Configuration**

```gradle
// android/app/build.gradle
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
}
```

#### 3. **Create Keystore**

```bash
# Generate keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Create key.properties
echo "storePassword=your_store_password" > android/key.properties
echo "keyPassword=your_key_password" >> android/key.properties
echo "keyAlias=upload" >> android/key.properties
echo "storeFile=../upload-keystore.jks" >> android/key.properties
```

### Build Commands

#### Debug Build

```bash
# Build debug APK
flutter build apk --debug

# Build debug app bundle
flutter build appbundle --debug
```

#### Release Build

```bash
# Build release APK
flutter build apk --release

# Build release app bundle
flutter build appbundle --release
```

### Google Play Store Deployment

#### 1. **Prepare Release**

```bash
# Build release bundle
flutter build appbundle --release

# Verify build
flutter build appbundle --release --verbose
```

#### 2. **Upload to Play Console**

1. Go to [Google Play Console](https://play.google.com/console)
2. Create new application
3. Upload AAB file from `build/app/outputs/bundle/release/`
4. Fill in store listing details
5. Configure pricing and distribution
6. Submit for review

#### 3. **Release Management**

```bash
# Version management
flutter build appbundle --release --build-name=1.0.0 --build-number=1

# Different flavors
flutter build appbundle --release --flavor production
flutter build appbundle --release --flavor staging
```

## 🍎 iOS Deployment

### Prerequisites

- macOS with Xcode
- Apple Developer Account
- iOS device or simulator

### Build Configuration

#### 1. **Update iOS Configuration**

```xml
<!-- ios/Runner/Info.plist -->
<key>CFBundleShortVersionString</key>
<string>1.0.0</string>
<key>CFBundleVersion</key>
<string>1</string>
<key>CFBundleIdentifier</key>
<string>com.flashlight.cashier</string>
```

#### 2. **Configure Signing**

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner project
3. Go to Signing & Capabilities
4. Configure Team and Bundle Identifier
5. Enable Automatic Signing

### Build Commands

#### Debug Build

```bash
# Build debug iOS
flutter build ios --debug

# Build for simulator
flutter build ios --debug --simulator
```

#### Release Build

```bash
# Build release iOS
flutter build ios --release

# Archive for App Store
flutter build ios --release --no-codesign
```

### App Store Deployment

#### 1. **Prepare for App Store**

```bash
# Build release
flutter build ios --release

# Open in Xcode
open ios/Runner.xcworkspace
```

#### 2. **Archive and Upload**

1. In Xcode, select "Any iOS Device"
2. Product → Archive
3. Distribute App → App Store Connect
4. Upload to App Store Connect

#### 3. **App Store Connect**

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Create new app
3. Configure app information
4. Upload screenshots and metadata
5. Submit for review

## 🌐 Web Deployment

### Build Configuration

#### 1. **Web Build Settings**

```dart
// web/index.html
<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="Flashlight Cashier - Point of Sale System">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flashlight Cashier</title>
  <link rel="manifest" href="manifest.json">
</head>
<body>
  <script src="flutter.js" defer></script>
</body>
</html>
```

#### 2. **Build Commands**

```bash
# Build web
flutter build web --release

# Build with base href
flutter build web --release --base-href="/cashier/"

# Build with custom renderer
flutter build web --release --web-renderer html
```

### Web Hosting Options

#### 1. **Firebase Hosting**

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting

# Deploy
firebase deploy
```

#### 2. **Netlify**

```bash
# Build for Netlify
flutter build web --release

# Deploy to Netlify
netlify deploy --prod --dir=build/web
```

#### 3. **Vercel**

```bash
# Build for Vercel
flutter build web --release

# Deploy to Vercel
vercel --prod
```

#### 4. **GitHub Pages**

```bash
# Build for GitHub Pages
flutter build web --release --base-href="/flashlight-cashier/"

# Deploy to GitHub Pages
# Use GitHub Actions or manual upload
```

## 🖥️ Desktop Deployment

### Windows Deployment

#### 1. **Build Windows App**

```bash
# Build Windows
flutter build windows --release

# Create installer
flutter build windows --release --target-platform windows-x64
```

#### 2. **Create Installer**

```bash
# Using Inno Setup
# Create installer script
# Build installer executable
```

### macOS Deployment

#### 1. **Build macOS App**

```bash
# Build macOS
flutter build macos --release

# Create DMG
flutter build macos --release --target-platform darwin-x64
```

#### 2. **Code Signing**

```bash
# Sign application
codesign --force --verify --verbose --sign "Developer ID Application: Your Name" build/macos/Build/Products/Release/Flashlight Cashier.app

# Create DMG
hdiutil create -volname "Flashlight Cashier" -srcfolder "build/macos/Build/Products/Release/Flashlight Cashier.app" -ov -format UDZO "Flashlight Cashier.dmg"
```

### Linux Deployment

#### 1. **Build Linux App**

```bash
# Build Linux
flutter build linux --release

# Create AppImage
flutter build linux --release --target-platform linux-x64
```

#### 2. **Package for Distribution**

```bash
# Create AppImage
# Create Snap package
# Create Flatpak package
```

## 🔧 CI/CD Pipeline

### GitHub Actions

#### 1. **Android CI/CD**

```yaml
# .github/workflows/android.yml
name: Android CI/CD

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Java
        uses: actions/setup-java@v3
        with:
          java-version: "11"
          distribution: "temurin"

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.8.0"

      - name: Install dependencies
        run: flutter pub get

      - name: Run tests
        run: flutter test

      - name: Build APK
        run: flutter build apk --release

      - name: Upload APK
        uses: actions/upload-artifact@v3
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk
```

#### 2. **iOS CI/CD**

```yaml
# .github/workflows/ios.yml
name: iOS CI/CD

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: macos-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.8.0"

      - name: Install dependencies
        run: flutter pub get

      - name: Run tests
        run: flutter test

      - name: Build iOS
        run: flutter build ios --release --no-codesign
```

#### 3. **Web CI/CD**

```yaml
# .github/workflows/web.yml
name: Web CI/CD

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.8.0"

      - name: Install dependencies
        run: flutter pub get

      - name: Run tests
        run: flutter test

      - name: Build Web
        run: flutter build web --release

      - name: Deploy to Firebase
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: "${{ secrets.GITHUB_TOKEN }}"
          firebaseServiceAccount: "${{ secrets.FIREBASE_SERVICE_ACCOUNT }}"
          channelId: live
```

### GitLab CI/CD

#### 1. **GitLab Pipeline**

```yaml
# .gitlab-ci.yml
stages:
  - test
  - build
  - deploy

variables:
  FLUTTER_VERSION: "3.8.0"

test:
  stage: test
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter test
    - flutter analyze

build_android:
  stage: build
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter build apk --release
  artifacts:
    paths:
      - build/app/outputs/flutter-apk/app-release.apk

build_ios:
  stage: build
  image: cirrusci/flutter:stable
  script:
    - flutter pub get
    - flutter build ios --release --no-codesign
  artifacts:
    paths:
      - build/ios/Release-iphoneos/Runner.app

deploy_web:
  stage: deploy
  image: node:16
  script:
    - npm install -g firebase-tools
    - flutter build web --release
    - firebase deploy --token $FIREBASE_TOKEN
```

## 🐳 Docker Deployment

### Dockerfile

```dockerfile
# Dockerfile
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:${PATH}"

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN flutter pub get

# Build web
RUN flutter build web --release

# Expose port
EXPOSE 8080

# Serve web app
CMD ["python3", "-m", "http.server", "8080", "--directory", "build/web"]
```

### Docker Compose

```yaml
# docker-compose.yml
version: "3.8"

services:
  flashlight-cashier:
    build: .
    ports:
      - "8080:8080"
    environment:
      - FLUTTER_WEB_AUTO_DETECT=true
    volumes:
      - ./build/web:/app/build/web
```

## 🔐 Security Considerations

### Code Signing

- **Android**: Use keystore for APK signing
- **iOS**: Use Apple Developer certificates
- **Windows**: Use Authenticode certificates
- **macOS**: Use Apple Developer certificates

### Environment Variables

```bash
# Production environment
export API_BASE_URL=https://api.flashlight-cashier.com
export DEBUG_MODE=false
export LOG_LEVEL=error

# Development environment
export API_BASE_URL=https://api-dev.flashlight-cashier.com
export DEBUG_MODE=true
export LOG_LEVEL=debug
```

### Secrets Management

```yaml
# GitHub Secrets
API_KEY: your_api_key
FIREBASE_SERVICE_ACCOUNT: your_service_account_json
APPLE_CERTIFICATE: your_apple_certificate
GOOGLE_PLAY_SERVICE_ACCOUNT: your_google_play_json
```

## 📊 Monitoring and Analytics

### Crash Reporting

```dart
// Firebase Crashlytics
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp());
}
```

### Performance Monitoring

```dart
// Firebase Performance
import 'package:firebase_performance/firebase_performance.dart';

final trace = FirebasePerformance.instance.newTrace('home_loading');
await trace.start();
// ... loading logic
await trace.stop();
```

### Analytics

```dart
// Firebase Analytics
import 'package:firebase_analytics/firebase_analytics.dart';

final analytics = FirebaseAnalytics.instance;
await analytics.logEvent(
  name: 'purchase_completed',
  parameters: {
    'value': 12.50,
    'currency': 'USD',
  },
);
```

## 🚀 Production Checklist

### Pre-Deployment

- [ ] All tests passing
- [ ] Code analysis clean
- [ ] Performance optimized
- [ ] Security review completed
- [ ] Documentation updated
- [ ] Version bumped
- [ ] Changelog updated

### Deployment

- [ ] Build artifacts created
- [ ] Signing certificates valid
- [ ] Environment variables set
- [ ] Database migrations run
- [ ] CDN cache cleared
- [ ] Monitoring configured

### Post-Deployment

- [ ] Health checks passing
- [ ] Performance metrics normal
- [ ] Error rates acceptable
- [ ] User feedback positive
- [ ] Rollback plan ready

## 🔄 Rollback Strategy

### Automated Rollback

```bash
# Rollback to previous version
kubectl rollout undo deployment/flashlight-cashier

# Check rollback status
kubectl rollout status deployment/flashlight-cashier
```

### Manual Rollback

1. **Identify Issues**: Monitor error rates and user feedback
2. **Stop Deployment**: Pause new deployments
3. **Revert Changes**: Rollback to previous stable version
4. **Verify Fix**: Confirm issues are resolved
5. **Resume Deployment**: Continue with normal operations

---

**Last Updated**: 2024-01-15
**Deployment Version**: 1.0.0
**Contact**: devops@flashlight-cashier.com
