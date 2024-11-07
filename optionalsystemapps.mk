android_app_import {
    name: "OptionalSystemApps",  # You can give a generic name here, as it will cover all apps
    apk: "vendor/apps/optional/*.apk",  # Auto-detect all APKs in the vendor_apps_optional directory
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
