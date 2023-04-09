
stop:
	docker stop $(docker ps -qn 1)


build:
	docker build -t clickhouse .

run:
	docker run -p 8123:8123 --ulimit nofile=262144:262144 clickhouse