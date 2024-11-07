

# Optional System Apps for Android

This repository provides a mechanism to automatically detect and treat APKs in the `vendor/apps/optional` directory as system apps. The APKs placed in this directory will be included in the build process and treated as privileged system apps.

## Purpose

This configuration allows you to easily manage and add multiple system apps to the build by simply placing APK files in the `vendor/apps/optional` directory. All APKs in this directory will automatically be detected and treated as system apps during the Android build process.

## How It Works

- **Path**: All APKs in the `vendor/apps/optional` directory are automatically detected.
- **System Apps**: All APKs are treated as **system apps** with **privileged permissions**.
- **No Manual Listing**: You don’t need to manually specify each APK in the `Android.mk` file. Simply place APKs in the directory, and they will be automatically included in the build.
- **Overrides**: APKs like "MusicFX" and "AudioFX" are specifically overridden for inclusion.

## Directory Structure

vendor/ └── apps/ └── optional/ ├── app1.apk ├── app2.apk └── app3.apk

## How to Add APKs

1. Place your APKs in the `vendor/apps/optional` directory.
2. The APKs will be automatically detected during the build process.

## Example Configuration in `Android.mk`

```plaintext
android_app_import {
    name: "OptionalSystemApps",  # A generic name to cover all apps
    apk: "vendor/apps/optional/*.apk",  # Auto-detect all APKs in the vendor/apps/optional directory
    presigned: true,
    privileged: true,  # All APKs in this directory are treated as system apps (privileged)
    preprocessed: true,
    skip_preprocessed_apk_checks: true,
    overrides: [
        "MusicFX",
        "AudioFX"
    ],
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
}

Notes

Privileged Apps: All APKs in the vendor/apps/optional directory are treated as privileged system apps.

Customization: You can customize the Android.mk file further by modifying the app import configuration to suit your project needs.
