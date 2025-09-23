# Cryptomentor Patch – UI Theme + Build Hotfix (2025-09-23, GMT+7)

**Mục tiêu**
- Sửa lỗi build thấy trong log:
  - `lib/pages/token_scanner.dart` – lỗi chuỗi/bullet `•` không nằm trong string, thiếu dấu nháy → đã fix.
  - `lib/main.dart:10:8 Error when reading 'lib/pages/wallet.dart'` → thêm `wallet.dart` chuẩn.
- Thêm **theme** & **CMCard** để giao diện **gần với HTML** (dark, border radius 16, gradient subtle, accent teal).

**Cấu trúc patch**
- `lib/theme/app_theme.dart` – theme sáng/tối đã tuỳ biến.
- `lib/widgets/cm_card.dart` – thẻ card theo style HTML.
- `lib/pages/dashboard.dart` – thay thế dùng `CMCard`.
- `lib/pages/token_scanner.dart` – bản đã fix cú pháp & bullet.
- `lib/pages/wallet.dart` – bổ sung file bị thiếu trên CI Linux.

**Cách áp dụng (không cần upload toàn bộ dự án)**
1. Giải nén patch này vào root project **(ghi đè các file trùng)**.
2. Mở `lib/main.dart` và dùng theme mới (nếu chưa có):
   ```dart
   import 'theme/app_theme.dart';
   // ...
   MaterialApp(
     title: 'Cryptomentor',
     theme: CMTheme.light(),
     darkTheme: CMTheme.dark(),
     home: const _Shell(),
   )
   ```
3. Chạy lại:
   ```bash
   flutter pub get
   flutter build apk --release
   ```

**Lưu ý**
- Nếu vẫn còn lỗi path, kiểm tra **Import path / tên file** phân biệt **chữ hoa–thường** trên runner Linux.
- Nếu CI báo lỗi network với RSS/API, build vẫn qua; chỉ ảnh hưởng runtime fetch.