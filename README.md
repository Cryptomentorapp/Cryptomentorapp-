# Cryptomentor – UI Full Pack
**What this is**
- Full Flutter `lib/` + `assets/` that *matches the HTML layout you approved* (dark navy + gold).
- A GitHub Actions workflow that **bootstraps** a Flutter project and builds APK automatically.
- All module screens exist. If a feature is not implemented yet, the screen shows **Coming soon**.

**How to use (GitHub web)**
1. Upload the entire contents of this zip to your repository root (keep folders).
2. Confirm these exist in repo:
   - `lib/`, `assets/`, `pubspec.yaml`, `.github/workflows/build-apk.yml`
3. Go to **Actions → Build Android APK → Run workflow**.
4. Download artifact `cryptomentor-apk`.

**Notes**
- You can replace `assets/logo_cmt.png` with your official logo; filename must stay the same.
- No external packages required; it compiles on stable Flutter.
