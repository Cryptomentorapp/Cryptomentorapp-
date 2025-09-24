# Cryptomentor (Free API Build-ready)
Modules: Market, News (RSS), Token Scanner, Whales, Admin, Settings, Pricing.

## Build APK (release)
```bash
flutter create .   # nếu repo chưa có folder android/ios
flutter pub get
flutter build apk --release
```
Artifacts: `build/app/outputs/flutter-apk/app-release.apk`

## Ghi chú
- API: CoinGecko (free), CryptoPanic RSS, CoinTelegraph RSS.
- Chuỗi có dấu `$` đã escape (`\$`).
- `CardThemeData` tương thích Flutter ổn định.