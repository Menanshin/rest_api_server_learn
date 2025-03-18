FROM python:3.11

WORKDIR /app

RUN apt-get update && apt-get install -y gcc

COPY rest_api_server /app/

RUN pip install --no-cache-dir -r requirements.txt

LABEL authors="e.maslov"

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
