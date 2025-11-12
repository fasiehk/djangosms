FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install system deps (for psycopg2, etc.)
RUN apt-get update && apt-get install -y build-essential libpq-dev gcc --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY . /app/

# Collect static files
RUN python manage.py collectstatic --noinput

EXPOSE 8080

CMD ["gunicorn", "student.wsgi:application", "--bind", "0.0.0.0:8080", "--workers", "2"]
