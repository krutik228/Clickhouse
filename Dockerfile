FROM clickhouse/clickhouse-server:latest

RUN mkdir nkrutikovdata

COPY dataset.zip ./nkrutikovdata/dataset.zip

COPY init-db.sh ./docker-entrypoint-initdb.d/01-init-recipes-db.sh
COPY extract-recipes.sh ./docker-entrypoint-initdb.d/02-extract-recipes.sh

RUN apt-get update  \
    && apt-get install -y unzip \
    && unzip ./nkrutikovdata/dataset.zip


# Открытие порта для подключения
EXPOSE 8123