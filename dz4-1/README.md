## Домашнее задание к занятию "4.1. Командная оболочка Bash: Практические навыки"  
#### Задание 1  
Есть скрипт:  

a=1  
b=2  
c=a+b  
d=$a+$b  
e=$(($a+$b))  
Какие значения переменным c,d,e будут присвоены? Почему?  

Переменная	Значение	Обоснование  
c	???	???  
d	???	???  
e	???	???  

Ответ:  

>c=a+b вернет a+b,  
>Арифметическая операция;  

![Рис.1-1](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/1-1.png)  

>d=$a+$b вернет 1+2,  
>a и b с символом $ происходит обращения к переменным  

![Рис.1-2](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/1-2.png)  

>e=$(($a+$b)) вернет 3,  
>конструкция ((..)) служит для арифметических операций  
![Рис.1-3](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/1-3.png)  


## Задание 2    
#### На нашем локальном сервере упал сервис и мы написали скрипт,   
#### который постоянно проверяет его доступность, записывая дату проверок до тех пор,   
#### пока сервис не станет доступным (после чего скрипт должен завершиться).   
#### В скрипте допущена ошибка, из-за которой выполнение не может завершиться,  
#### при этом место на Жёстком Диске постоянно уменьшается. Что необходимо сделать, чтобы его исправить:  

	while ((1==1)  
	do  
		curl https://localhost:4757  
		if (($? != 0))  
		then  
			date >> curl.log  
		fi  
	done  

Решение:  

	while ((1==1))  
>добавил закрывающую круглую скобку  
	do  
		curl https://192.168.88.117:8080  
		if (($? != 0))  
		then  
			date >> curl.log  
	else  
		break
>добавил условие, если сервис становиться доступным, то прерываем  
	fi  
		sleep 5
>также добавид sleep. Будет чуть реже писать данные в файл. В данном случае раз в 5 секунд  	
	done  
Проверим работу скрипта:  
>Для корректной работы скрипта добавим права файлу:  
	chmod u+x bash.sh

Сам скрипт:  
![Рис.2-1](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/2-1.png)  
>Отключил сервер, показывает, что сервис недоступен. 
>Включил сервер, отображается доступность сервера. Но отображает ошибку сертификата SSL, так как указал https.  
![Рис.2-2](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/2-2.png)  

>Также решил попробовать сделать скрипт с утилитой wget.  
>Не совсем корректно использовать в данном случае ее использовать  
>, так как тут проверяется доступность файла (страницы сайта) бывыет что требуется для определенных ресурсов  
![Рис.2-3](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/2-3.png)  

>Скрипт работает и пишет информацию в файл:  
![Рис.2-4](https://github.com/sasha047/devops-netology/blob/main/dz4-1/img/2-4.png)  


## Задание 3  
#### Необходимо написать скрипт, который проверяет доступность трёх IP: 192.168.0.1,  
#### 173.194.222.113, 87.250.250.242 по 80 порту и записывает результат в файл log.  
#### Проверять доступность необходимо пять раз для каждого узла.  
Ваш скрипт:  

	#!/usr/bin/env bash  
	hosts=(192.168.88.10 188.123.42.213 87.250.250.24)  
 
	for i in {1..5}  
	do  
	date >> hosts.log  
    		for h in ${hosts[@]}  
    		do  
			curl -Is --connect-timeout 10 $h:80  
        		echo "    check" $h status=$? >> hosts.log  
    		done  
	done  


## Задание 4  
#### Необходимо дописать скрипт из предыдущего задания так,  
#### чтобы он выполнялся до тех пор, пока один из узлов не окажется недоступным.  
#### Если любой из узлов недоступен - IP этого узла пишется в файл error, скрипт прерывается.  

Ваш скрипт:  
???
## Дополнительное задание (со звездочкой*) - необязательно к выполнению    
#### Мы хотим, чтобы у нас были красивые сообщения для коммитов в репозиторий.   
#### Для этого нужно написать локальный хук для git, который будет проверять,   
#### что сообщение в коммите содержит код текущего задания в квадратных скобках и количество символов   
#### в сообщении не превышает 30. Пример сообщения: [04-script-01-bash] сломал хук.  

Ваш скрипт:
???