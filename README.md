# Cryptomentor — Full Project (API Free, Heavy Mock)
- Live API: CoinGecko + CryptoPanic/CoinTelegraph RSS (no key).
- Large mock dataset: 20k tokens, 3k whales, 10k signals, 800 lessons, 2.5k news.
- PackageId: `com.cryptomentor.app` via workflow.

Build:
```bash
flutter pub get
flutter create .
# ensure android/app/build.gradle has applicationId "com.cryptomentor.app"
flutter build apk --release
```
