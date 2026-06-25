# Sheckless Counter - Android APK Build Guide

## Prerequisites for Codemagic

1. **Java 17+** (Codemagic provides this)
2. **Android NDK r21e** (Codemagic provides this)
3. **Node.js 18+** (Codemagic provides this)

## How to Build on Codemagic

### Step 1: Connect Repository
1. Go to https://codemagic.io
2. Sign in with your GitHub account
3. Click "Add application"
4. Select `sheckless-counter-new` repository
5. Click "Finish"

### Step 2: Configure Build
Codemagic will auto-detect `codemagic.yaml`. No additional setup needed for debug builds!

### Step 3: Start Build
1. Click "Start new build"
2. Select branch (main)
3. Click "Build"

### Step 4: Download APK
Once build completes:
- Debug APK: `android/app/build/outputs/apk/debug/app-debug.apk`
- Release APK: `android/app/build/outputs/apk/release/app-release.apk`

## What Happens Automatically

The `codemagic.yaml` will:
1. ✅ Install Node dependencies (`npm install`)
2. ✅ Install Capacitor tools
3. ✅ Build your web app (already in `public/`)
4. ✅ Generate Android project (using `cap init` & `cap add android`)
5. ✅ Sync web files into Android
6. ✅ Run `./gradlew assembleDebug` to build APK
7. ✅ Upload APK as artifact

## For Release/Signed APK

You'll need to configure:
1. **Keystore file** (your app signing key)
2. **Keystore password** (in Codemagic secrets)
3. **Key alias** (in Codemagic secrets)

Then update `codemagic.yaml` to sign the release build.

## Troubleshooting

- **Build fails at Capacitor sync?** - Web files in `public/` may be missing
- **Gradle build fails?** - Java 17 is required (auto-provided by Codemagic)
- **APK not generated?** - Check build logs in Codemagic dashboard

## Local Testing (Optional)

To test locally before pushing to Codemagic:
```bash
npm install
npm install -D @capacitor/core @capacitor/cli @capacitor/android
npx cap init "Sheckless Counter" com.sheckless.counter --web-dir public
npx cap add android
npx cap sync android
cd android
./gradlew assembleDebug
```

APK will be at: `android/app/build/outputs/apk/debug/app-debug.apk`
