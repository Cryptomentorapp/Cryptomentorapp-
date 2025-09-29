# Cryptomentor 📱

Cryptomentor là ứng dụng AI hỗ trợ trader:

- **CMT Hub**: hiển thị giá CMT, quản lý ví.
- **Token Scanner**: quét token theo tên/contract, phân tích rủi ro, volume, marketcap.
- **News**: cập nhật tin tức từ CryptoPanic + CoinTelegraph.
- **Signals**: AI phân tích kỹ thuật, đưa cảnh báo realtime.
- **Whale Tracker**: theo dõi top ví ETH/BSC.
- **Academy**: khoá học cơ bản & nâng cao cho trader.

## 🔧 Build APK

Yêu cầu:
- Flutter 3.x
- Dart SDK 3.x
- Android SDK 34+

Cách build:
```bash
flutter clean
flutter pub get
flutter build apk --release
```

Artifact APK sẽ nằm ở:
```
build/app/outputs/flutter-apk/app-release.apk
```

## ⚙️ Workflow CI/CD

Repo có sẵn `.github/workflows/android-apk.yml`:
- Tự động build APK khi push vào branch `main`.
- Tải file `.apk` trong tab **Actions → Artifacts**.

## 📖 License

MIT License
