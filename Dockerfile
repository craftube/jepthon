FROM python:3.10-slim

# تحديد مجلد العمل الأساسي كما يتوقعه السورس بالضبط
WORKDIR /root/JoKeRUB

# تثبيت كافة حزم النظام المطلوبة
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    libsqlite3-dev \
    gcc \
    g++ \
    make \
    python3-dev \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# نسخ جميع ملفات مستودعك إلى مجلد /root/JoKeRUB
COPY . /root/JoKeRUB

# تعريف مسار البايثون لتلافي أخطاء الاستيراد
ENV PYTHONPATH=/root/JoKeRUB:$PYTHONPATH

# تحديث وتثبيت مكتبات البايثون
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt

# أمر التشغيل المباشر
CMD ["python3", "-m", "JoKeRUB"]
