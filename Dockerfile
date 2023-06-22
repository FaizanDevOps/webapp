# Stage 1: Build dependencies
FROM python:3.9 AS builder

WORKDIR /app

COPY requirements.txt .

# Install Python dependencies
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Runtime image
FROM python:3.9

# Copy installed dependencies from the builder stage
COPY --from=builder /root/.local /root/.local

# Set working directory
WORKDIR /app

# Copy the application code
COPY . .

# Add the user base binary path to PATH
ENV PATH=/root/.local/bin:$PATH

# Start the application
CMD [ "python", "app.py" ]
