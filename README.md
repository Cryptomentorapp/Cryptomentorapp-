# Cryptomentor (Free API Build-ready, FIXED)
Modules: Market, News (RSS), Token Scanner, Whales, Admin, Settings, Pricing.

## Build APK (local)
```bash
flutter create .
flutter pub get
flutter build apk --release
# Artifact: build/app/outputs/flutter-apk/app-release.apk
```

## CI (GitHub Actions)
Workflow `android-apk.yml` đã kèm:
- setup-java 17
- flutter-action stable
- `flutter create .`
- `flutter pub get`
- build release APK
- upload artifact

## Ghi chú fix
- Đổi `and` → `&&`
- Escape `\$` trong chuỗi
- `_usd()` format an toàn