FROM python:3.10-slim

WORKDIR /root/JoKeRUB

# تثبيت كافة حزم النظام المطلوبة بما فيها ImageMagick
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
    imagemagick \
    libmagickwand-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /root/JoKeRUB

ENV PYTHONPATH=/root/JoKeRUB:$PYTHONPATH

RUN pip install --no-cache-dir lxml_html_clean moviepy==1.0.3
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "start.py"]
CMD ["python3", "-m", "JoKeRUB"]
