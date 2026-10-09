FROM python:3.10-slim

WORKDIR /app

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

# نسخ ملفات مستودعك المعدلة مباشرة بدلاً من سحب السورس الأصلي
COPY . .

# تثبيت متطلبات البايثون
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt

#working directory 
WORKDIR /root/JoKeRUB

ENV PATH="/home/JoKeRUB/bin:$PATH"

CMD ["python3","-m","JoKeRUB"]
