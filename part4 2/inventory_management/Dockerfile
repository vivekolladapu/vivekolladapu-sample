# Your Solution
FROM --platform=linux/amd64 python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the container's /app directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the app directory to the container's /app directory
COPY . .
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]
CMD uvicorn app.main:app --host 0.0.0.0 --port $PORT