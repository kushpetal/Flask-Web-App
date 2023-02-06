FROM python:3.7-slim-buster

MAINTAINER Kush Patel "kushpatel@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

RUN pip install --upgrade pip

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
