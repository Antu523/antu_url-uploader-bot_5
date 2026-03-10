# পাইথনের সঠিক এবং স্টেবল ভার্সন ব্যবহার করা হচ্ছে
FROM python:3.10-slim-buster

# প্রয়োজনীয় প্যাকেজ ইনস্টল করা (Debian base ব্যবহার করায় এখন apt-get কাজ করবে)
RUN apt-get update && \
    apt-get install -y ffmpeg jq python3-dev && \
    rm -rf /var/lib/apt/lists/*

# কাজের ডিরেক্টরি সেট করা
WORKDIR /app

# ফাইলগুলো কপি করা
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .

# বোট রান করার কমান্ড
CMD ["python3", "bot.py"]
