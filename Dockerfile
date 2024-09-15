# Use official Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /usr/src/app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port where the app will run
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]

