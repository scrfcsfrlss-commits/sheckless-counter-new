# How to Build a Native APK — Sheckless Counter

## Requirements
- Node.js 18+ installed
- Android Studio installed (https://developer.android.com/studio)
- Java JDK 17+ installed

---

## Steps

### 1. Install dependencies
```bash
npm install
npm install -D @capacitor/core @capacitor/cli @capacitor/android
```

### 2. Initialize Capacitor (first time only)
```bash
npx cap init "Sheckless Counter" com.sheckless.counter --web-dir public
```

### 3. Add Android platform (first time only)
```bash
npx cap add android
```

### 4. Sync web files into Android project
```bash
npx cap sync android
```

### 5. Open in Android Studio
```bash
npx cap open android
```

### 6. Build APK in Android Studio
- Go to **Build → Build Bundle(s) / APK(s) → Build APK(s)**
- APK will be at: `android/app/build/outputs/apk/debug/app-debug.apk`

---

## File Structure
```
sheckless-counter/
├── public/
│   ├── index.html       ← Main app (all UI, CSS, JS)
│   ├── manifest.json    ← PWA manifest
│   ├── sw.js            ← Service worker (offline)
│   ├── icon-192.png     ← App icon
│   └── icon-512.png     ← App icon (large)
├── server.js            ← Express server (for web hosting)
├── package.json         ← Node dependencies
├── capacitor.config.json ← Capacitor / native config
└── BUILD_APK.md         ← This file
```

---

## Also works as PWA
Open the published URL in Chrome (Android) or Safari (iOS) → 
tap "Add to Home Screen" for an app-like experience without building an APK.