# Use official Python slim image
FROM python:3.9-slim

# Set working dir
WORKDIR /app

# Copy application
COPY hello.py /app/hello.py

# Default command
CMD ["python", "hello.py"]
