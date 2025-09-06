# Cryptomentor APK (One-Click via GitHub Actions)
**Date:** 2025-09-06

You said you don't write code. This repo lets you get an APK by just **uploading it to GitHub** and clicking **Run workflow**.

## Steps (takes ~5–10 min cloud time)
1. Create a new **private** GitHub repo.
2. Upload everything from this zip.
3. Go to **Actions** → enable workflows (if asked).
4. Choose **Build Android APK** → **Run workflow** (top-right).
5. Wait until it finishes, then download the artifact **cryptomentor-apk** → it contains `app-release.apk`.

### Feature flags (already defaulted for MVP)
- DEX / Whales / Admin / Guardian are **OFF** by default.
- CMT Max Supply is **2,000,000,000** by default.
You can flip flags in the Action input fields if needed (optional).

## What’s inside
- Minimal Flutter app with **Coming soon** gates for unfinished modules (still clickable).
- Live BTC/USDT price via Binance WS (with fallback polling).
- RiskBadge + number formatter (K/M/B/T).

