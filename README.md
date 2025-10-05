
# Cryptomentor — Flutter Native (no WebView)

- Black-gold UI like the provided HTML
- Native screens: Home (8 modules grid), Signals, DEX (1inch quote), News, AI chat (configurable backend), Settings, Token Info, Whales Tracker, Academy (placeholders to extend)
- Mock data bundled for Signals, can wire to real backend in `lib/services/*`
- GitHub Actions provided to auto-build APK

## Build
```bash
flutter pub get
flutter create --project-name cryptomentor --org com.appx.cryptomentor .
flutter build apk --release
```
