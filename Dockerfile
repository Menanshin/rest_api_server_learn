FROM python:3.12.1 AS builder

RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*

RUN --mount=type=bind,source=requirements.txt,target=/app/requirements.txt \
  pip wheel --no-cache-dir --no-deps -r /app/requirements.txt --wheel-dir /app/wheels

COPY app.py /app/

RUN addgroup --system app \
  && adduser --system --group app \
  && chown -R app:app /app/
USER app

WORKDIR /app

LABEL authors="e.maslov"

ENTRYPOINT ["uvicorn"]
CMD ["app:app", "--host", "0.0.0.0"]
