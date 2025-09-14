# Cryptomentor – Flutter (Full UI Pack)

This pack contains a **compilable** Flutter app with the agreed UI and module tabs. It supports:
- Trading Signals (list + detail)
- Token Scanner (input + risk result placeholder)
- Research Hub (list)
- Settings

### Switch API: demo vs backend
Open `lib/utils/config.dart`:
- `useDemoData = true` → offline demo.
- Set `baseUrl` to your Cloud Run / Firebase Functions domain when you have it, then set `useDemoData = false`.

### Build locally
```
flutter pub get
flutter build apk --release
```

### GitHub Actions
- Push to `main`
- Actions → **Build Android APK** → Run
Artifacts: `cryptomentor-apk.apk` (release), `cryptomentor-apk-debug.apk` (debug)
