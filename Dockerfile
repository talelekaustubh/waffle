FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8500

ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
