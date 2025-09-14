# Cryptomentor – Flutter Pack (v3)
- Copy toàn bộ **nội dung** folder này lên repo GitHub (ở root).
- Workflow: `.github/workflows/build-apk.yml`.
- Có `assets/images/cmt_logo.png`. Thay ảnh này bằng logo CMT của anh (giữ nguyên path).

## Build local
```
flutter pub get
flutter build apk --release
```

## Build on GitHub Actions
Actions → **Build Android APK (Patched v3.1)** → tải artifact `cryptomentor-apk`.
