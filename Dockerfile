FROM python:3.10-slim as builder

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

RUN python test_app.py


FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app

EXPOSE 5000
CMD ["python", "app.py"]