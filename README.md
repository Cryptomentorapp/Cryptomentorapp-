
# Cryptomentor Full V7 (Flutter)

**Mục tiêu:** Tất cả module có UI đầy đủ, icon/đổ bóng theo theme; API thật nếu `kApiBase` có — nếu không app tự fallback **mock** để **không tab nào trống**. Có sẵn GitHub Actions để build **APK release**.

## Build nhanh
```bash
flutter create .
flutter pub get
flutter run
flutter build apk --release
```
APK: `build/app/outputs/flutter-apk/app-release.apk`

## Cấu hình API
Sửa `lib/config.dart`:
```dart
const bool kStoreMode = true;
const String kApiBase = "https://api.anh.com";
```
Endpoints mẫu: `/market/top`, `/signals/active`, `/signals/history`, `/whales/inflows`, `/whales/outflows`, `/whales/recents`, `/launchpad/phases`.

## Icon & Font chuẩn HTML
- Thay các icon SVG trong `assets/icons/` bằng icon của anh. Giữ tên file nếu đã map trong code; nếu thêm icon mới chỉ cần gọi `SvgPicture.asset('assets/icons/xxx.svg')` ở màn tương ứng.
- Thả font TTF thật (Inter/Roboto hoặc font của anh) vào `assets/fonts/` để khớp 100% typography. Hiện đang để placeholder để build không lỗi.

## Module trong V7
- Home + BottomNav
- Market (API/mock)
- Signals (API/mock)
- CMT Hub (UI + placeholder chart)
- Launchpad (API/mock)
- Whales (API/mock)
- Research, Academy, Community (UI đầy đủ)
- Admin (feature-flags)
- Wallet (placeholder kết nối)

> Khi có API thật, chỉ set `kApiBase` — không phải đổi UI.
