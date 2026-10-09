FROM python:3.10-slim

WORKDIR /app

# تثبيت الحزم الأساسية للنظام
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    libsqlite3-dev \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملفات السورس
COPY . .

# تحديث وتثبيت المكتبات
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt
#clonning repo 
RUN git clone https://github.com/jepthoniq/jepthon.git /root/JoKeRUB
#working directory 
WORKDIR /root/JoKeRUB

# Install requirements
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN pip3 install --no-cache-dir -r requirements.txt

ENV PATH="/home/JoKeRUB/bin:$PATH"

CMD ["python3","-m","JoKeRUB"]
