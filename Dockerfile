# start from an official image
FROM python:3.6

RUN mkdir -p /gunicorn-freeze
WORKDIR /gunicorn-freeze

# install pip3
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN apt-get install -y \
    python3-pip

COPY . /gunicorn-freeze/

# install project dependencies
RUN pip3 install -r ./requirements.txt

ENV PYTHONPATH="/gunicorn-freeze"
RUN python3 manage.py migrate

# expose port 8888
EXPOSE 8888

CMD ["gunicorn", "-c", "gunicorn_conf.py", "-b", ":8888", "--env", "DJANGO_SETTINGS_MODULE=gunicorn_freeze.settings", "gunicorn_freeze.wsgi:application"]