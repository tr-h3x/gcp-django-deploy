#used only for local dev server

#alpine is lightweight version of linux recommended while running docker containers
FROM python:3.9-alpine
LABEL maintainer="trwhex@gmail.com"

COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app


RUN python -m venv /py && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home django-user

ENV PATH="/py/bin:$PATH"

USER django-user 