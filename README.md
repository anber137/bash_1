# Домашнее задание к занятию "5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"

## Задача 1

### Решение:

1. Отличие режимов работы сервисов Docker Swarm кластере заключается, в том, что в режиме [global](https://docs.docker.com/engine/swarm/how-swarm-mode-works/services/) сервис запускается на всех нодах. Если используется режим  replication, то указывается количество реплик используемых для сервиса.

2. Для управления глобальным состоянием кластера используется протокол [Raft](https://docs.docker.com/engine/swarm/raft/) в задачи, которые решаются данным протоколом так же входить выбор лидера.

3. Используется для связи контейнеров расположенных на разных хостах. При построении используется уже существующая сеть и технология vxlan. Может быть включено шифрование IPSec.

## Задача 2

### Решение:

![Снимок экрана 05_05_01](images/S_05_05_01.png)

## Задача 3

### Решение:

![Снимок экрана 05_05_02](images/S_05_05_02.png)
 
## Задача 4

### Решение:

![Снимок экрана 05_05_03](images/S_05_05_03.png)

По умолчанию логи Raft зашифрованы. Функция была введена для поддержки Docker secrets.
Ключи используются для шифрования и дишифрования логов Raft. 
