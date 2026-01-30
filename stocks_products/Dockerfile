
# Используем компактный Python на Alpine Linux
FROM python:3.9-alpine
 
# Устанавливаем рабочую директорию в контейнере
WORKDIR /app
 
# Устанавливаем системные зависимости (SQLite + инструменты сборки)
RUN apk add --no-cache gcc musl-dev libffi-dev sqlite
 
# Копируем файл зависимостей перед копированием всего кода
COPY requirements.txt .
 
# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir -r requirements.txt
 
# Копируем оставшиеся файлы проекта
COPY . .
 
# Применяем миграции (без создания новых)
RUN python manage.py migrate --noinput
 
# Собираем статику (если в проекте есть `STATICFILES_DIRS`)
RUN python manage.py collectstatic --noinput || echo "No static files found"
 
# Открываем порт 8000
EXPOSE 8000
 
# Устанавливаем точку входа
ENTRYPOINT ["python", "manage.py"]
 
# Запускаем сервер Django
CMD ["runserver", "0.0.0.0:8000"]




#FROM python:3.10

#COPY ./requirements.txt /src/requirements.txt
#RUN pip install -r /src/requirements.txt

#COPY . /src

#WORKDIR /src

#RUN python manage.py migrate

#EXPOSE 4000

#CMD ["gunicorn", "--bind", "0.0.0.0:8000", #"stocks_products.wsgi"]