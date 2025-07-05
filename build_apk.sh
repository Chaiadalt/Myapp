#!/bin/bash

# עדכן את המערכת
sudo apt-get update

# התקן תלויות מערכת
sudo apt-get install -y \
    python3.9 python3.9-venv \
    git zip unzip openjdk-11-jdk \
    zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev

# צור סביבה וירטואלית עם פייתון 3.9
python3.9 -m venv venv
source venv/bin/activate

# שדרג pip והתקן תלויות פייתון
pip install --upgrade pip
pip install buildozer cython==0.29.36

# צור קובץ buildozer.spec אם אין
if [ ! -f buildozer.spec ]; then
    buildozer init
fi

# עדכן את קובץ ה-buildozer.spec
echo "[app]
title = MyApp
package.name = myapp
package.domain = org.mydomain
source.dir = .
requirements = python3==3.9,kivy
android.sdk = 33
android.ndk = 25b
p4a.branch = master

[buildozer]
log_level = 2" > buildozer.spec

# תיקון שגיאת jnius (לפני הבנייה)
find ~/.buildozer -name jnius_export_class.h -exec sed -i 's/from long import Py_jlong/from long long import Py_jlong/' {} \;

# בצע את הבנייה
buildozer android debug

# הצג את קובץ ה-APK
ls -l bin/


