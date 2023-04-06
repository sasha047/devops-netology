## Домашнее задание к занятию 4. «Оркестрация группой Docker-контейнеров на примере Docker Compose»


#### Задача 1
Создайте собственный образ любой операционной системы (например ubuntu-20.04) с помощью Packer (инструкция).

Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.
![Рис. 1-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/1-1.png)
#### Задача 2
2.1. Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.

![Рис. 2.1-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.1-1.png)  
![Рис. 2.1-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.1-1.png)  
2.2.* (Необязательное задание)
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud). Используйте Terraform-код в директории (src/terraform).
- Вывод команды: terraform init  
![Рис. 2.2-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-1.png)  
- Вывод команды: terraform apply  
![Рис. 2.2-2](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-2.png)  
- тут нужно было ввести "yes"  
![Рис. 2.2-3](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-3.png)  
- вводим "yes". Видим, что машина создалась и присвоились адреса  
![Рис. 2.2-4](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-4.png)  
- Проверяем, что машина создалась, в личном кабинете.  
![Рис. 2.2-5](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-5.png)  
- Заходим на машину по ssh key  
![Рис. 2.2-6](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-6.png)  

- Команда по поиску существующих образов, взял id одного из них для установки.  
![Рис. 2.2-7](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-7.png)  
- также улушил немного конфигруационные файлы. Вынес в переменные данные о пользователе и ssh key  
![Рис. 2.2-8](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/2.2-8.png)  


Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.

Задача 3
С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana. Используйте Ansible-код в директории (src/ansible).
- Отредактировал файл, указал ssh key
![Рис. 3-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/3-1.png)  
- Заходим по ssh на машину и проверяем запущенные docker образы  
![Рис. 3-2](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/3-2.png)  

Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в docker-compose, должны быть в статусе "Up".

Задача 4
Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
Используйте для авторизации логин и пароль из .env-file.
Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками(dashboards).
Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.
![Рис. 4-1](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/4-1.png)  
![Рис. 4-2](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/4-2.png)  
![Рис. 4-3](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/4-3.png)  


Чтобы получить зачёт, предоставьте:

скриншот работающего веб-интерфейса Grafana с текущими метриками, как на примере ниже.


Задача 5 (*)
Создайте вторую ВМ и подключите её к мониторингу, развёрнутому на первом сервере.
Решение:  

- В директории  exporters/docker-compose.exporters.yml создаем по аналогии с node01  
- Создаем docker-compose.yml с секциями nodeexporter и cadvisor  
- Создаем node02.yml по аналогии с provision.yml  
- Добавляем node02 - ansible-playbook node02.yml  
- В Grafana на дашбордах в Metrics-Legend добавляем {{instance}}  

![Рис. 5-2](https://github.com/sasha047/devops-netology/blob/main/dz5-4/img/-2.png)

Чтобы получить зачёт, предоставьте:

скриншот из Grafana, на котором будут отображаться метрики добавленного вами сервера.
