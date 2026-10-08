FROM python:3.14

RUN useradd --create-home --uid 10001 appuser
WORKDIR /app

COPY app/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser app/ .
USER appuser

EXPOSE 8000
CMD ["python", "main.py"]