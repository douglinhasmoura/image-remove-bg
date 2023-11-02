# Use the official Python image from Docker Hub as a base image
FROM python:3.10

# Set the working directory within the container
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Install the necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Gunicorn will listen on
EXPOSE 5000

# Define the command to run your application with Gunicorn
CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:5000"]
