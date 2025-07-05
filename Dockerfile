FROM ubuntu:22.04

# הגדרות בסיסיות
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    python3.9 python3.9-venv git zip unzip openjdk-11-jdk \
    zlib1g-dev autoconf libtool pkg-config

# הגדרת סביבת עבודה
WORKDIR /app
COPY . .

# התקנת Buildozer
RUN python3.9 -m venv venv
RUN . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install buildozer cython==0.29.36

# תיקון שגיאת jnius
RUN find /root/.buildozer -name jnius_export_class.h -exec sed -i 's/from long import Py_jlong/from long long import Py_jlong/' {} \; 2>/dev/null || true

# הרצת הבנייה
CMD . venv/bin/activate && buildozer android debug
