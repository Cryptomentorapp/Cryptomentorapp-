# Cryptomentor Patch (2025-09-23, GMT+7)
- Escape `$` trong strings (pricing, token_scanner).
- Sửa `ThemeData.cardTheme` dùng `CardThemeData`.
- Bổ sung admin_panel, settings, wallet (nếu thiếu).
## Áp dụng
Giải nén vào gốc project → Replace file trùng → chạy:
flutter pub get
flutter build apk --release