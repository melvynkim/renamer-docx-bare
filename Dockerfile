FROM python:3.7.6-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

#RUN apt update
#RUN apt-get install gcc python3-dev postgresql postgresql-contrib musl-dev -y whatever

RUN pip install --upgrade pip

COPY requirements.docker.txt /code/
RUN pip install -r requirements.docker.txt

RUN apt-get update && apt-get install -y netcat && apt-get install -y cron
RUN apt-get install -y cron

COPY . /code/
RUN chmod 755 entrypoint.sh

ENTRYPOINT ["/code/entrypoint.sh"]