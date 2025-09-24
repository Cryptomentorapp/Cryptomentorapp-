# Cryptomentor FULL (Free API) — Build-ready
Modules: Market, News (CryptoPanic + CoinTelegraph RSS), Token Scanner (search+scan+hotlist+risk), Whales, Admin, Settings, Pricing.

## Build APK (local)
```bash
flutter create .
flutter pub get
flutter build apk --release --no-shrink
# -> build/app/outputs/flutter-apk/app-release.apk
```

## Notes
- Fixed token_scanner: `&&`, escaped `\$`, safe `_usd()`.
- Free APIs only (no secrets).