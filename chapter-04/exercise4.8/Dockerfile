FROM python:3.9-slim

WORKDIR /app

# Copy requirements và cài đặt dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ .

# Expose port
EXPOSE 8080

# Chạy ứng dụng
CMD ["python", "app.py"]

