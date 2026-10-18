# BG # Dada — phone-friendly Android build starter

This project includes the initial Flutter UI and a GitHub Actions workflow to build an Android APK in the cloud, so you can start from an Android phone without installing Android Studio locally.

## Important status
The APK produced from this starter is only a UI prototype. Live XAUUSD data, AI analysis, screen capture, voice chat, Google sign-in, cloud persistence, subscriptions, and admin access are not connected yet.

## Build from an Android phone
1. Download and extract this ZIP using your phone's file manager.
2. Create/sign in to a GitHub account at https://github.com/.
3. Create a **public or private repository** named `bg-dada-forex`.
4. Upload the contents of this folder to the repository root (including the hidden `.github` folder and its workflow file). GitHub's web uploader may not show hidden folders; if so, use the repository web editor to create `.github/workflows/build-apk.yml` and paste the workflow content from this ZIP.
5. Open the repository's **Actions** tab and select **Build BG Dada Android APK**.
6. Tap **Run workflow** (or wait for the first push build to finish).
7. Open the completed workflow run and download the artifact named `bg-dada-android-apk`.
8. Extract the artifact ZIP to get `app-release.apk`, then tap it to install. Android may ask you to allow installation from that browser/file manager.

## Updating later
Commit changes to the repository. The workflow will build a fresh APK. Keep your project repository and any production database backups safe.

## Production notes
Before selling this app, configure a secure backend, Google/Firebase authentication, real market data, AI provider, privacy policy, payment/subscription compliance, and server-side admin permissions. Never store broker passwords in the app.
