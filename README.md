
# Cryptomentor Android Fix Kit v1

This kit gives you a **known-good** Android app module to eliminate the "blank APK" issue and ensure:
- Internet permission
- minSdk 21, targetSdk/compileSdk 34
- MultiDex on for large dependency graphs
- Release shrink/minify disabled (you can re-enable later)
- Cleartext traffic (for 127.0.0.1 / dev backends) via `network_security_config.xml`
- A visible UI **by default** using a `WebView` that loads a local asset (`assets/index.html`)—so you always see something when the APK launches, even without network

You can build this module **standalone** or **drop it** into your existing project to test your environment and isolate config problems.

---

## Option A — Build Standalone (fastest sanity check)

1. Open this folder in Android Studio (`android-patch`).
2. Let Gradle sync. If prompted, install SDK 34 and JDK 17.
3. Run the **`app`** configuration on a device/emulator. You should see a page titled **"Cryptomentor Debug Screen"**.

**CLI:**

```bash
./gradlew :app:assembleDebug
```
APK will be at: `app/build/outputs/apk/debug/app-debug.apk`

---

## Option B — Drop-in to your existing project

1. Backup your existing `/app/src/main`.
2. Copy:
   - `app/src/main/AndroidManifest.xml`
   - `app/src/main/java/com/cryptomentor/MainActivity.kt`
   - `app/src/main/res/xml/network_security_config.xml`
   - `app/src/main/assets/index.html`
3. Merge `app/build.gradle`:
   - Ensure:
     - `compileSdkVersion 34`
     - `defaultConfig { minSdkVersion 21; targetSdkVersion 34; multiDexEnabled true }`
     - `buildTypes.release { minifyEnabled false; shrinkResources false }` (turn back on later)
     - `dependencies { implementation 'androidx.multidex:multidex:2.0.1'; implementation 'androidx.webkit:webkit:1.11.0' }`
4. Rebuild and run.

If your app uses a different package name, update the Kotlin package path and manifest package accordingly.

---

## GitHub Actions (optional, but helpful)

`/.github/workflows/build-apk.yml` is included. It builds a Debug APK on every push/tag.
- Uses JDK 17 + Android SDK
- Runs `./gradlew :app:assembleDebug`

---

## Why WebView + local asset?

Most "blank screen" APKs are caused by missing permissions, cleartext/network issues, or the UI failing before first frame. This approach guarantees a visible frame so you can verify the **app boots**. You can then wire it to your real UI (Compose/Fragment/Activity) once the basics are solid.

---

## Diagnostics

Run:
```bash
./gradlew --version
./gradlew tasks
```
Make sure JDK 17 is used. If you see immediate Gradle errors, open Android Studio and allow it to upgrade the Gradle wrapper/AGP as needed.

---

## Next steps

- Replace the WebView with your real entry activity or host your Compose/Fragment inside `MainActivity`.
- Re-enable ProGuard/R8 once you're stable, and add the necessary `-keep` rules for your frameworks.
- If your app embeds a web app, switch the WebView to load your real local/remote URL and keep the `network_security_config.xml` during development.
```

