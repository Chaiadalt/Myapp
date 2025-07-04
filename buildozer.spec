[app]
title = My App
package.name = myapp
package.domain = org.test
source.dir = .
source.include_exts = py,png,jpg,kv,atlas
version = 0.1
requirements = python3,kivy==2.1.0,libffi,openssl,sqlite3,cython==0.29.33
orientation = portrait
icon.filename = %(source.dir)s/data/icon.png
presplash.filename = %(source.dir)s/data/presplash.png
fullscreen = 0

[buildozer]
log_level = 2
warn_on_root = 1

# --- Android specific settings ---
# Default NDK version is r25b. For other versions, see https://github.com/actions/python-versions
android.ndk_path = /usr/lib/android-ndk
android.sdk_path = /usr/lib/android-sdk


