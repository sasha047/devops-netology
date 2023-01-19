## Домашнее задание к занятию "3.9. Элементы безопасности информационных систем"  

### Задание  
#### 1. Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.  

Решение:  
>Плагин установил. Пароли добавил.  

>На работе и дома используется KeePass, удобен. Можно расшарить на сервере локально (не выпуская в интернет), установить определенные доступы для сотрудников.  
Ответ:  
![Рис. 1](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/1.png)  

#### 2. Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.  

Ответ:  
>Настройки произвел  

![Рис. 2](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/2.png)  

#### 3. Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.  

Решение:  
>Выполнил последовательно команды и отредактировал конфиги:  
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
	sudo nano /etc/apache2/conf-available/ssl-params.conf  

![Рис. 3-3](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/3-3.png)  

	sudo cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak  
	sudo nano /etc/apache2/sites-available/default-ssl.conf  
![Рис. 3-4](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/3-4.png)  

	sudo a2enmod ssl  
	sudo a2enmod headers  
	sudo a2ensite default-ssl  
	sudo a2enconf ssl-params  
	sudo apache2ctl configtest  
	sudo systemctl restart apache2  

![Рис. 3-1](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/3-1.png)  
![Рис. 3-2](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/3-2.png)  

#### 4. Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК ... и тому подобное).  
Решение:
>В процессе обучения наткнулся на офигенное опенсерсное решение.  
	testsst.sh ему название  
>склонировал репозиторий. запустил dockerfile с указанием сайта, который проверяем 
>Проверял ранее созданный мной сайт для учреждения  
	 docker run --rm -ti  drwetter/testssl.sh -U --sneaky https://ds249.ru

![Рис. 4](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/4.png)  

#### 5. Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.  

Решение:  
>Последовательно выполним команды:  
	ssh-keygen (сгенерируем ключ, в процессе предложит сохранить ключ в файле c заданным именем и запаролить его)  
	ssh-copy-id -i .ssh/id_rsa bav@192.168.88.117 (копируем ключ на другой сервер)  
	
	ssh bav@192.168.88.117 (подключаемся к серверу с ключем)  
>На скриншоте: я перезаписал уже ранее созданный ключ, задал ему пароль, скопировал ключ на сервер,  
> где уже был ключ. Перезаписал ключ на сервере. Подключился к серверу по ключу, введя пароля на ключ.  
![Рис. 5](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/5.png)  


#### 6. Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.  

Решение:  
>Выполнил команды:  
	sudo mv ~/.ssh/id_rsa ~/.ssh/id_rsa_zabbix  
	sudo nano ~/.ssh/config  
>		Host zabbix  
>        		HostName 192.168.88.117  
>        		User bav  
>        		Port 22  
>        		IdentityFile ~/.ssh/id_rsa_zabbix  
	ssh zabbix    
![Рис. 6](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/6.png)  


#### 7. Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.  
Решение:  
![Рис. 7-1](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/7-1.png)  
![Рис. 7-2](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/7-2.png)  

## Задание для самостоятельной отработки* (необязательно к выполнению)  

#### 1* Просканируйте хост scanme.nmap.org. Какие сервисы запущены?  
Ответ:  
>ssh  
>web-server  
>nping-echo server  
>открыт порт 31337  

![Рис. nmap](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/nmap.png)  

#### 2* Установите и настройте фаервол ufw на web-сервер из задания 3. Откройте доступ снаружи только к портам 22,80,443  
Ответ:  
>Открытые порты на моем сервере, включая те, которые указаны в задании.  
![Рис. ufw](https://github.com/sasha047/devops-netology/blob/main/dz3-9/img/ufw.png)  

