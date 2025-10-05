# Cryptomentor — Flutter (Demo-Ready)

This is a **complete Flutter client** with multiple feature screens (Dashboard, Signals, DEX, News, AI Chat, Settings).
It ships with mock/offline data so you can **build an APK immediately**.

> If the `android/` platform folder is missing or incomplete, just regenerate it with one command (below).

---

## 🚀 Build APK (Android Studio or CLI)

### Option A — Android Studio
1. Open Android Studio → **Open** this folder.
2. Android Studio may prompt: *"This Flutter project is missing some platform folders."*
   - Run **`flutter pub get`** from the terminal.
   - Run **`flutter create .`** to generate `android/` and `ios/`.
3. Click **Run** to install on your phone, or run:  
   ```bash
   flutter build apk --release
   ```

### Option B — CLI (no Android Studio UI)
```bash
cd cryptomentor
flutter pub get
flutter create .
flutter build apk --release
# The APK will be at build/app/outputs/flutter-apk/app-release.apk
```

> If your Flutter SDK is new, run `flutter doctor` once to install Android toolchain.

---

## 🔐 Feature Flags & Mock Data
- **DEX Aggregator**: mocked (can wire to 1inch or 0x later in `lib/services/dex_service.dart`).
- **Signals**: mock JSON at `assets/json/signals.json`.
- **News**: mock JSON at `assets/json/news.json` with external links opening via `url_launcher`.
- **AI Chat**: offline rules / prompt; replace with your backend endpoint in `ai_service.dart`.
- **Security Layers**: stubs in `lib/utils/security.dart` (7 layers placeholder).

---

## 🧭 Structure
```
lib/
  main.dart
  app_theme.dart
  router.dart
  models/
  services/
  utils/
  screens/
  widgets/
assets/
  images/
  json/
```

---

## ⚙️ Next Steps (Hook real APIs)
- DEX: add 1inch/0x calls in `services/dex_service.dart`.
- News: replace mock with RSS/API in `services/news_service.dart`.
- Signals: point to your backend in `services/signal_service.dart`.
- AI: set your endpoint/baseUrl in `services/ai_service.dart`.
- Branding: replace images under `assets/images/`.

---

## 📝 License
Private repo, internal testing only.


## CI on GitHub Actions
- Workflow file at `.github/workflows/flutter.yml` auto-builds APK on push to `main`.
