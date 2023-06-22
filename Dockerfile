FROM python:3.9

# Install dependencies
RUN apt-get update \
    && apt-get install -y postgresql-client

# Set working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Start the application
CMD [ "python", "app.py" ]
