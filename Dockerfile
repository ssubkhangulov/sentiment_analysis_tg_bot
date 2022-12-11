FROM python:3.10.9-slim-buster

RUN apt-get update -qy && apt-get install -qy git git-lfs

RUN git clone https://huggingface.co/cardiffnlp/twitter-roberta-base-sentiment /app/cardiffnlp/twitter-roberta-base-sentiment

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt

COPY . /app

CMD ["python3", "./bot.py"]
