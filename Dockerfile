FROM python:3.10

COPY ./requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt

COPY . /src

WORKDIR /src

RUN python manage.py migrate

EXPOSE 4000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "stocks_products.wsgi"]