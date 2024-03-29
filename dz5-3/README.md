
# Домашнее задание к занятию "3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

## Задача 1

Сценарий выполения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберете любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность:
запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```
Решение:  

Создал репозиторий:  
![Рис.1-1](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-1.png)  
![Рис.1-2](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-2.png)
![Рис.1-3](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-3.png)
![Рис.1-4](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-4.png)
![Рис.1-5](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-5.png)

Скачал образ Nginx  
![Рис.1-2](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-2.png)  

Создал дирректорию и в ней Dockerdile и файл dockerfile.txt с содержащий HTML-код, который передается в файл Index.html  
![Рис.1-3](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-3.png)  

Авторизовался для отправки образа в репозиторий  
Создал Fork образа  
Запушил образ в свой репозиторий  
![Рис.1-4](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-4.png)  

Запустил свой образ и видим результат (правда что-то с кодировкой)  
![Рис.1-5](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/1-5.png)  

Ссылки на форк https://hub.docker.com/r/sasha047/devops-netology/tags.  

## Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос:
"Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

- Высоконагруженное монолитное java веб-приложение;
- Nodejs веб-приложение;
- Мобильное приложение c версиями для Android и iOS;
- Шина данных на базе Apache Kafka;
- Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
- Мониторинг-стек на базе Prometheus и Grafana;
- MongoDB, как основное хранилище данных для java-приложения;
- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.

Ответ:  
* Для монолитного и высоконагруженного необходим прямой доступ к ресурсам. Потребуется физический сервер или ВМ.  
* Nodejs веб- приложения- отлично справится Docker. Таких приложений и образов существует множество. Зпускал образы ранее.  
* Для приложения iOS и Android лучше всего подойдет ВМ, так как треубется GUI.  
* Apache Kafka - также лучше всего использовать ВМ.  
* Elasticseach - на ВМ в виде кластера. Kibana и Logstash также на ВМ или в Docker, вполне подходит.  
* Prometheus и Grafana также в Docker, так как только выводят информацию из логов.  
* MongoDB - для больших данных и нагрузке потребуется физический сервер. Иногда хватит и ВМ.  
* Gitlab на ВМ. Docker для сервисов.  

Часть из описанного работает у нас на Proxmox. Docker в основном для тестирования.

## Задача 3

- Запустите первый контейнер из образа ***centos*** c любым тэгом в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```;
- Добавьте еще один файл в папку ```/data``` на хостовой машине;
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.

<<<<<<< HEAD
Решение:  

Запустил оба контейнера с подключенной папкой data  
![Рис.3-1](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/3-1.png)  

Подключился к первому контейнеру и создал файл README.md  
На хостовой машине создал файл new_file.txt и поместил в папку data  
Поключился ко второму контейнеру и в папке data видим оба файла  
![Рис.3-2](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/3-2.png)  

=======
![Рис.3-1](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/3-1.png)
![Рис.3-2](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/3-2.png)
>>>>>>> 9e39d73983fa4fbeeb07383e916c55155297be80

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

Соберите Docker образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.

![Рис.4-1](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/4-1.png)
![Рис.4-2](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/4-2.png)
![Рис.4-3](https://github.com/sasha047/devops-netology/blob/main/dz5-3/img/4-3.png)

Также были изучены команды по удалению всех докеров и образов:
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
---
