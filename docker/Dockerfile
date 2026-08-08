FROM python:3.12-slim

# Prevent Python from creating .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Send Python logs directly to stdout
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first
# This improves Docker layer caching
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY app.py .

# Application port
EXPOSE 5000

# Start Flask
CMD ["python", "app.py"]