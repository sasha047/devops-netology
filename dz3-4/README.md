## 1. На лекции мы познакомились с node_exporter. В демонстрации его исполняемый файл 
## запускался в background. Этого достаточно для демо, но не для настоящей production-системы,   
## где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd,   
## создайте самостоятельно простой unit-файл для node_exporter:  

    поместите его в автозагрузку,  
  
    предусмотрите возможность добавления опций к запускаемому процессу   
    через внешний файл (посмотрите, например, на systemctl cat cron),  
  
    удостоверьтесь, что с помощью systemctl процесс корректно стартует,   
    завершается, а после перезагрузки автоматически поднимается.  
Решение:  
Скачал последнюю версию в папку tmp  
![Рис.1-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-1.png)  
  
Создадал директорию, назначим права на нее и распаковал в нее архив. Все команды выполнил через && последовательно.  
![Рис.1-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-2.png)  
  
Создал конфиг на оснвании предложенного по default. отредактировал по себя. Добавил в автозагрузку. Это первая версия кофигурации  
![Рис.1-3](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-3.png)  
  
После неудачных запусков и ошибок отредактировал так: закоментиорвал строку, на которую ругался и заодно добавил пути для логов  
![Рис.1-4](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-4.png)  
  
Стартанул, остановил несколько раз. тепреь без ошибок. Добавил в исключения firewall порт 9100  
![Рис.1-5](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-5.png)  
![Рис.1-6](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-6.png)  
![Рис.1-7](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/1-7.png)  

>Пришлоось немного помучится. обычно проблем особых не возникало со службами. 
>тут не в какую не хотел запускаться и пути менял и конфигурацию.
 
## 2. Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. 
## Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, 
## памяти, диску и сети.

CPU: (у меня два процессора)  
	TYPE node_cpu_seconds_total counter  
	node_cpu_seconds_total{cpu="0",mode="idle"} 72712.49  
	node_cpu_seconds_total{cpu="0",mode="iowait"} 9.76  
	node_cpu_seconds_total{cpu="0",mode="irq"} 0  
	node_cpu_seconds_total{cpu="0",mode="nice"} 3.63  
	node_cpu_seconds_total{cpu="0",mode="softirq"} 8.39  
	node_cpu_seconds_total{cpu="0",mode="steal"} 0.44  
	node_cpu_seconds_total{cpu="0",mode="system"} 122.65  
	node_cpu_seconds_total{cpu="0",mode="user"} 84.87  	
	node_cpu_seconds_total{cpu="1",mode="idle"} 72785.57  
	node_cpu_seconds_total{cpu="1",mode="iowait"} 6.67  
	node_cpu_seconds_total{cpu="1",mode="irq"} 0  
	node_cpu_seconds_total{cpu="1",mode="nice"} 3.07  
	node_cpu_seconds_total{cpu="1",mode="softirq"} 1.71  
	node_cpu_seconds_total{cpu="1",mode="steal"} 0.3  
	node_cpu_seconds_total{cpu="1",mode="system"} 101.7  
	node_cpu_seconds_total{cpu="1",mode="user"} 84.09  
![Рис.2-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/2-1.png)  


Memory:  

	node_memory_MemAvailable_bytes   
	node_memory_MemFree_bytes  
	node_memory_SwapCached_bytes gauge  
![Рис.2-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/2-2.png)  

Disk: (на каждый диск отдельно)  

	node_disk_io_time_seconds_total{device="sda"}   
	node_disk_read_bytes_total{device="sda"}   
	node_disk_read_time_seconds_total{device="sda"}   
	node_disk_write_time_seconds_total{device="sda"}  
![Рис.2-3](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/2-3.png)  


Network:  

	node_network_receive_errs_total{device="eth0"}   
	node_network_receive_bytes_total{device="eth0"}   
	node_network_transmit_bytes_total{device="eth0"}  
	node_network_transmit_errs_total{device="eth0"}  

![Рис.2-4](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/2-4.png)  

Hwmon_temp: Также бы я добавил температуру  

	node_hwmon_*

## 3. Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata).  
Решение:  

![Рис.3-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-1.png)  

После успешной установки:  

    в конфигурационном файле /etc/netdata/netdata.conf в секции [web]   
    замените значение с localhost на bind to = 0.0.0.0,  
![Рис.3-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-2.png)  

    добавьте в Vagrantfile проброс порта Netdata на свой локальный   
    компьютер и сделайте vagrant reload:  
    config.vm.network "forwarded_port", guest: 19999, host: 19999  
![Рис.3-3](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-3.png)  

### После успешной перезагрузки в браузере на своем ПК (не в виртуальной машине) 
### вы должны суметь зайти на localhost:19999. 
### Ознакомьтесь с метриками, которые по умолчанию собираются Netdata 
### и с комментариями, которые даны к этим метрикам.
В браузере:  
![Рис.3-4](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-4.png)  

Проверил сединения по порту:  
![Рис.3-5](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-5.png)  

Ознакомился с метриками, посморел загрузку памяти:  
![Рис.3-6](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/3-6.png)  

## 4. Можно ли по выводу dmesg понять, осознает ли ОС, 
## что загружена не на настоящем оборудовании, а на системе виртуализации?
Ответ:  
Да, ОС понимает это.   
![Рис.4-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/4-1.png)  

>Если бы ОС была развернута на чистом железе, то было бы указано: harware   
>Но у меня Proxmox, в котором развернута Ubuntu, на которой развернут Vagrant )))  
>(вложенная виртуализация).   
>На Proxmox:  
![Рис.4-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/4-2.png)  

## 5. Как настроен sysctl fs.nr_open на системе по-умолчанию?   
## Определите, что означает этот параметр.   
## Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?  
Ответ:  
Параметр fs.nr - это число открытых десктрипторов в системе

![Рис.5-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/5-1.png)  

	Максимальный предел равен: cat /proc/sys/fs/file-max  
	9223372036854775807  
>Проверил мягкие и жеские лимиты. Мягкий ulimit -Sn можно увеличивать в процессе работы  
>Жесткий лимит можно только уменьшить, увеличить нельзя.  
![Рис.5-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/5-2.png)  


## 6. Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, 
## а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, 
## что ваш процесс работает под PID 1 через nsenter. 
## Для простоты работайте в данном задании под root (sudo -i). 
## Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.
Решение:  
>nsenter- Запускает новую команду в пространстве имён уже запущенного процесса.   
>Особенно полезно для работы с образами Docker.  
>дополнительно почитал в man и man в инете https://man7.org/linux/man-pages/man1/unshare.1.html

![Рис.6new](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/6new.png)  

## 7. Найдите информацию о том, что такое :(){ :|:& };:. 
## Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 22.04 
## (это важно, поведение в других ОС не проверялось). 
## Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. 
## Вызов dmesg расскажет, какой механизм помог автоматической стабилизации.
## Как настроен этот механизм по-умолчанию, и как изменить число процессов, 
## которое можно создать в сессии?

Ответ:  
>Запустил в Vagrant, смотрим нагрузку на ВМ Ubuntu 22.04  
![Рис.7-1](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-1.png)  

>Посмотрим загрузку VM  
![Рис.7-2](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-2.png)  

![Рис.7-3](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-3.png)  

>В итоге эта бесконечная процедура затянулась на несколько часов.   
>Но при этом я мог зайти второй сессией на нее.  
>После того как операция завершилась- зайти уже не смог. Машина не работала.  
  
>Собрал VM на Ubuntu 22.04  
![Рис.7-4](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-4.png)  

>Процесс прошел буквально меньше, чем за минуту. Запустид dmesg.  
>Смотрим, что процесс завершился с помощью fork rejecked.  
![Рис.7-5](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-5.png)  

>После превышения параметров распрделения и ограничения ресурсов,   
>произошел выход из-за цикливания.  

![Рис.7-6](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-6.png)  

>Выставил ограничения на число создаваемых  процессов на пользователя равное 50.  

![Рис.7-7](https://github.com/sasha047/devops-netology/blob/main/dz3-4/img/7-7.png)  

>Потом также запустил :(){ :|:& };:  

