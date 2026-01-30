# Для сборки образа и запуска контейнера необходимо выполинить следующее:
1. docker build . -t myapp:1.1
2. docker run -it -d -p 8000:4000 --name=stocks_products myapp:1.1
3. curl localhost:8000/
