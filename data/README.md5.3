# Домашнее задание к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

## Задача 1

### Решение

Создаем Dockerfile

	FROM nginx
	COPY ./html /usr/share/nginx/html/
	EXPOSE 80

Собераем образ:

	docker build -t web04 .

Логинимся на hub.docker.com

	root@n:/home/projects/docker# docker login --username anber137
	Password:
	WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
	Configure a credential helper to remove this warning. See
	https://docs.docker.com/engine/reference/commandline/login/#credentials-store

	Login Succeeded

Размещаем образ на hub.docker.com

	docker tag web04 anber137/web04
	docker push anber137/web04

Проверяем:

Очищаем останавливаем все экземпляры и образы

	docker stop $(docker ps -qa) && docker rm $(docker ps -qa) && docker rmi -f $(docker images -qa ) && docker volume rm $(docker volume ls -q) && docker network rm $(docker network ls -q)

Скачиваем образ с hub.docker.com и запускаем контейнер

	docker run -d -p80:80 anber137/web04


[https://hub.docker.com/anber137_web04](https://hub.docker.com/repository/docker/anber137/web04)


## Задача 2

### Решение

	Высоконагруженное монолитное java веб-приложение;

Для высоконагруженного монолитного java веб-приложения скорее выбиру либо виртуальную машину либо физический сервер.
JVM не оптимизирована для работы в Docker но запуск вполне возможен. Сообщество Fabric8 предлагает готовый образ,
в котором уже решены возникающие проблемы с корректным определением ресурсов. В JDK 9 включена поддрежка работы в контенере но в тестовом режиме;

	Nodejs веб-приложение;

Использование Docker для Nodejs веб-приложение вполне возможно. На hub.docker.com имюется готовые образы с установленными Node.js, npm.

	Мобильное приложение c версиями для Android и iOS;

Мобильное приложение c версиями для Android и iOS. Для сборки и тестрования Android приложений на просторах интернета имеются статьи в которых применяется Docker, но это будет эмулятор с миртуальной машиной. За основу ядра Android хоть и был взят Linux, но все же это уже не то ядро, также используется процессор ARM иной архитектуры. Для iOS ситуация аналогичная.
Пример запуска iOS из Linux [iOS](https://dev.to/ianito/how-to-emulate-ios-on-linux-with-docker-4gj3) Используется kvm и возникает вопрос правомерности (нарушение лицензинного соглашения). При разработке комерческого приложения как в одном так и в другом случае использование Docker считаю не оправданным.

	Шина данных на базе Apache Kafka;

Использование Docker вполне возможно для шины данных на базе Apache Kafka. При использовании Apache Kafka основное требование будет - это высокопроизводительная дисковая подсистема.

	Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana

Для данного полнотекстового поиска использование Docker оправданно. Каких либо явных ограничений нет. Из плюсов - затраченное время на развертование.

	Мониторинг-стек на базе Prometheus и Grafana; 

В Prometheus для сбора информации используется node_exporter и ему соответственно нужен прямой доступ к интерфейсу ядра.
Сам Prometheus, также как Grafana вполне нормально работают в контейнере. 

	MongoDB, как основное хранилище данных для java-приложения;

MongoDB запускается и успшно работает в Docker. Обращается к БД java - приложение или приложение на другом языку не принципиально.

	Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.

Можно использовать Docker. Имеются соответствующие образы в Docker и описание на официальном сайте: 
[docs.gitlab](https://docs.gitlab.com/ee/install/docker.html)

## Задача 3

### Решение

Скачиваем образы и запускаем контейнеры с подключенной директорией data:

	docker run -itd -v /home/projects/docker/data/:/data centos
	docker run -itd -v /home/projects/docker/data/:/data debian

	root@n:/home/projects/docker# docker ps
	CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
	8f9ff8371d92   debian    "bash"        7 minutes ago   Up 7 minutes             great_mirzakhani
	ecf0908f985f   centos    "/bin/bash"   8 minutes ago   Up 8 minutes             frosty_archimedes

Заходим в centos, проверяем версию, создаем файл с сообщением

	root@n:/home/projects/docker# docker exec -it ecf0908f985f  bash

	[root@ecf0908f985f /]# cat /etc/redhat-release
	CentOS Linux release 8.4.2105

	[root@ecf0908f985f /]# echo "1. Hello from centos" > /data/messages

Выходим из centos и создаем файл с сообщением из хоста:

	root@n:/home/projects/docker# echo "2. hello from host" > ./data/messages_host

Заходим в debian, проверяем версию и выводим содержимое директории /data и файлов:

	root@8f9ff8371d92:/# cat /etc/issue
	Debian GNU/Linux 11 \n \l

	root@n:/home/projects/docker# docker exec -it 8f9ff8371d92 bash

	root@8f9ff8371d92:/# find /data/ -type f -name \* | xargs -i bash -c 'echo "File name: " {} && cat {}'
	File name:  /data/messages
	1. Hello from centos
	File name:  /data/messages_host
	2. hello from host

