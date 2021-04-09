FROM python:3-alpine

RUN apk -U upgrade

COPY ./requirements.txt /flaskr/requirements.txt

ARG FLASK_APP=flaskr

WORKDIR /flaskr
RUN pip install -r requirements.txt
COPY . /flaskr

RUN flask init-db

CMD ["gunicorn", "-w 4", "-b 0.0.0.0", "flaskr.wsgi:app"]
