# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
# Assume you have a requirements.txt, which is a best practice
# If not, directly install Django via pip
RUN pip install django

# Run Django migrations
# This assumes that you have set up your Django project correctly
# and have the necessary settings for your database
RUN python manage.py migrate

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
# For example, you can set the debug mode for Django in development
ENV DEBUG=True

# Run the app when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
