[app]
title = My App
package.name = myapp
package.domain = org.test
source.dir =.
source.include_exts = py,png,jpg,kv,atlas,ttf,json,mp3
version = 1.0
requirements = python3,kivy==2.2.1
orientation = portrait

[buildozer]
log_level = 2
warn_on_root = 0

[android]
fullscreen = 0
android.permissions = INTERNET,READ_EXTERNAL_STORAGE,WRITE_EXTERNAL_STORAGE
android.api = 34
android.minapi = 21
android.ndk = 25b
android.ndk_api = 21
android.archs = arm64-v8a, armeabi-v7a
