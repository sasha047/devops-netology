#####Домашнее задание к занятию "3.6. Компьютерные сети. Лекция 1"  
##Задание  
##1. Работа c HTTP через телнет.  
>Подключитесь утилитой телнет к сайту stackoverflow.com telnet stackoverflow.com 80  
>Отправьте HTTP запрос  
    GET /questions HTTP/1.0  
    HOST: stackoverflow.com  
    [press enter]  
    [press enter]  
>В ответе укажите полученный HTTP код, что он означает?  
Ответ:  
>HTTP 403 Forbidden — стандартный код ответа HTTP, означающий,  
>что доступ к запрошенному ресурсу запрещен. Сервер понял запрос, но не выполнит его.  
![Рис.1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/1.png)  
  
  
##2. Повторите задание 1 в браузере, используя консоль разработчика F12.  
    откройте вкладку Network  
    отправьте запрос http://stackoverflow.com  
    найдите первый ответ HTTP сервера, откройте вкладку Headers  
    укажите в ответе полученный HTTP код  
Ответ:   
>204 No Content — сервер успешно обработал запрос,  
>но в ответе были переданы только заголовки без тела сообщения.  
>Клиент не должен обновлять содержимое документа,   
>но может применить к нему полученные метаданные. Появился в HTTP/1.0.  
![Рис.2-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/2-1.png)  
    проверьте время загрузки страницы, какой запрос обрабатывался дольше всего?    
    приложите скриншот консоли браузера в ответ.  
![Рис.2-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/2-2.png)  

Ответ:  
>Страница полностью прогрузилась за 1.75 s.  
>Самый долгий запрос  380 ms- первоначальная загрузка страницы  

##3. Какой IP адрес у вас в интернете?    
##Какому провайдеру принадлежит ваш IP адрес?    
Решение:  
![Рис.3-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/3-1.png)  
![Рис.3-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/3-2.png)  
![Рис.3-3](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/3-3.png)  
Ответ:  
    Провайдер RDTC  
    netname: RDTC-NET   
##4. Какой автономной системе AS? Воспользуйтесь утилитой whois  
Решение:  
![Рис.4-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/4-1.png)  
![Рис.4-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/4-2.png)  

Ответ:  
>Автономная система: AS29072  
  
##5 Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8?  
##Через какие AS? Воспользуйтесь утилитой traceroute  
Решение:  
>Выяснилось, что есть две утилиты  inetutils-traceroute и traceroute  
>Первая из них имеет ограниченное количество возможностей. Воспользовался второй.  
![Рис.5-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/5-1.png)  
![Рис.5-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/5-2.png)  

Ответ:  
     Пакеты проходят через автономные системы:  
     AS29072  
     AS12389  
     AS15169  
![Рис.5-3](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/5-3.png)  

##6. Повторите задание 5 в утилите mtr. На каком участке наибольшая задержка - delay?  
Решение:  
![Рис.6-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/6-1.png)  
![Рис.6-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/6-2.png)  

Ответ: Наибольшая задержка  
    12. AS15169  216.239.58.69        0.0%     1   62.2  62.2  62.2  62.2   0.0  

##7. Какие DNS сервера отвечают за доменное имя dns.google? Какие A записи? Воспользуйтесь утилитой dig  
Ответ:  
![Рис.7](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/7.png)  

##8. Проверьте PTR записи для IP адресов из задания 7. Какое доменное имя привязано к IP? Воспользуйтесь утилитой dig  
Ответ:  
![Рис.8-1](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/8-1.png)  
![Рис.8-2](https://github.com/sasha047/devops-netology/blob/main/dz3-6/img/8-2.png)  
