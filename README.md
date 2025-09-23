# Cryptomentor – Flutter All-in-One (Fixed)
- Modules: Dashboard, Market, CMT Hub, Signals, Whales (Top50 watchlist), DEX, Wallet, **Token Scanner (Scan + Hotlist)**, **News** (CryptoPanic + CoinTelegraph), Pricing, Admin, Settings.
- Build locally:
```
flutter create --org com.cryptomentor .
flutter pub get
flutter build apk --release
```
- GitHub Actions daily build at 08:00 GMT+7 in `.github/workflows/daily-apk.yml`.