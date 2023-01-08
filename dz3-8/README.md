## Домашнее задание к занятию "3.8. Компьютерные сети, лекция 3"  
##### Цель задания  
##### В результате выполнения этого задания вы:  

## Задание
1. Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP  
telnet route-views.routeviews.org  
Username: rviews  
show ip route x.x.x.x/32  
show bgp x.x.x.x/32  

Ответ:  
![Рис.1-1](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/1-1.png)  
![Рис.1-2](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/1-2.png)  
![Рис.1-3](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/1-3.png)  
![Рис.1-4](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/1-4.png)  
![Рис.1-5](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/1-5.png)  

2. Создайте dummy0 интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.
![Рис.2-1](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/2-1.png)  
![Рис.2-2](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/2-2.png)  
![Рис.2-3](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/2-3.png)  
![Рис.2-4](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/2-4.png)  
![Рис.2-5](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/2-5.png)  

##### 3. Проверьте открытые TCP порты в Ubuntu, какие протоколы и приложения используют эти порты? Приведите несколько примеров.  
Решение:  
>Проверку проводил на своем сервере  

>Использовал две разные кманды  
>netstat -ntlp | grep LISTEN  из пакета net-tools  
>ss -tnlp  
![Рис.3](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/3.png)  

Ответ:  
>80, 8008 - Apache  
>53 -  служба для работы dns  
>22 - ssh   
>10050-10051 - Zabbix Agent  
>8080 - Zabbix  
>5432 - postresql  

##### 4. Проверьте используемые UDP сокеты в Ubuntu, какие протоколы и приложения используют эти порты?  
Решение:  
>Использовал две разные команды:  
>netstat -unlp  
>ss -unap  
![Рис.4](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/4.png)  
>53 - Служба для работв с DNS
>68 - Используется хостами  для получения  IP-адресации от DHCP-сервера.  

5. Используя diagrams.net, создайте L3 диаграмму вашей домашней сети или любой другой сети, с которой вы работали.
![Рис.5-1](https://github.com/sasha047/devops-netology/blob/main/dz3-8/img/5-1.png)  

Ответ:   
>Построена домашняя локальная сеть на микротиках. Используется повседневно. постоянно дорабатываетя  
>Часть ip-адресов скрыл. Облачный не стал указывать.
В качестве решения ответьте на вопросы, опишите, каким образом эти ответы были получены и приложите по неоходимости скриншоты

Задание для самостоятельной отработки* (необязательно к выполнению)
Установите Nginx, настройте в режиме балансировщика TCP или UDP.

Установите bird2, настройте динамический протокол маршрутизации RIP.

Установите Netbox, создайте несколько IP префиксов, используя curl проверьте работу API.
