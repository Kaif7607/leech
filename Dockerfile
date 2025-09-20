

FROM python:3.10.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       libffi-dev \
       musl-tools \
       ffmpeg \
       aria2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

CMD gunicorn app:app & python3 main.py
