FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8501

ENV REPLICATE_API_TOKEN=${REPLICATE_API_TOKEN}
ENV REPLICATE_MODEL_ENDPOINT=${REPLICATE_MODEL_ENDPOINT}

CMD ["streamlit", "run", "streamlit_app.py"]
