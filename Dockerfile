FROM python:3.10-slim

WORKDIR /app

# تثبيت جميع حزم النظام والاعتماديات بما فيها Node.js و NPM
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

# نسخ كافة ملفات السورس
COPY . .

# تحديث وتثبيت مكتبات البايثون
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt
#clonning repo 
RUN git clone https://github.com/jepthoniq/jepthon.git /root/JoKeRUB
#working directory 
WORKDIR /root/JoKeRUB

ENV PATH="/home/JoKeRUB/bin:$PATH"

CMD ["python3","-m","JoKeRUB"]
