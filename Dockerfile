FROM python:3.12-slim

LABEL authors="dev"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update
RUN apt-get update \
  && apt-get install -y --no-install-recommends libssl-dev libgeos-dev build-essential libpq-dev libffi-dev libjpeg-dev zlib1g zlib1g-dev
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /code
COPY ./requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
#COPY ./entrypoint.sh /code/
#RUN sed -i 's/\r$//g' /code/entrypoint.sh
#RUN chmod a+x /code/entrypoint.sh
COPY . /code/
