# Домашнее задание к занятию "5.1. Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения."

## Задача 1: Опишите кратко, как вы поняли: в чем основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.
Ответ:
* При полной (аппаратной) виртуализации в качестве ОС выступает гипервизор, который является звеном между физическим хостом и гостевой ОС.
* В паравиртуализации звеном я вляется гипервизор уже между хостовой ОС и гостевой ОС.
* При виртуализации на основе ОС создается пространство для контейнеров. Но при этом в контейнерах используется ядро хоста. 

Ещё разница в производительности. Чем больше модифицирована ОС, тем производительность выше. 
Наиболее высокая у виртуализации средствами ОС, так как приложения напрямую используют ядро хостовой ОС.

## Задача 2: Выберите один из вариантов использования организации физических серверов, в зависимости от условий использования.

| Условия | Организация | Решение |
| --- | --- | --- |
| Высоконагруженная база данных, чувствительная к отказу | физические сервера | При виртуализации увеличивается латентность. Для высоконагруженной системы это нежелательно. Постоянно нагруженной системе потребуется максимум ресурсов хоста. Отказоустойчивость достигается резервированием  |
| Различные web-приложения | виртуализация уровня ОС | Так как приходится часто и много разворачивать веб-приложения на одном хосте, необходимо  обеспечить их изоляцию друг от друга. Виртуализация ОС подходит лучше всего. Можно свернуть приложение в контейнер и развернуть из него. Чуть дольше это делать с виртуальными машинами с полноценной ОС и отдельным ядром. |
| Windows системы для использования бухгалтерским отделом | паравиртуализация | Виртуализация поможет системе быть более отказоустойчивой, из предложенных вариантов для Windows возможна только паравиртуализация. |
| Системы, выполняющие высокопроизводительные расчеты на GPU | виртуализация уровня ОС | Виртуализация GPU необходима при работе, например, AutoCAD. Для GPU возможна только виртуализация средствами ОС |


| По своему и опыту колег отличным решением для большинства задач будет Proxmox. Для мелких и крупных организаций является недорогим решением. Работает и справляется с задачами даже на простом железе. |
P.S. Также использую ее дома на сервере.


## Задача 3: Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

>Со всеми задачами отлично справится Proxmox. Proxmox предоставляет готовый, очень многофункциональный 
>и в тоже время простой и интуитивно понятный интерфес практически для всего что нужно. 
>Он из коробки умеет кластеризацию и поддерживает механизм fencing основанный на softdog
>постоянно на домашнем сервере тестирую и пробую). Но дополню, ипользуюя другие варианты:

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.

> Подойдут Hyper-V, vSphere, Proxmox: они поддерживают виртуальные машины с Windows и Linux, имеют встроенные перечисленные возможности (балансировка, репликация, бекапы) и могут работать в кластере гипервизоров, что необходимо для работы 100 виртуальных машин. 

2. Требуется наиболее производительное бесплатное open source решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.

>Лучше всего подойдёт Proxmox: поддерживает Windows ОС в качестве гостей.

3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры.

>Proxmox, Hyper-V Server, максимальная совместимость и OpenSource (Proxmox).

4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

> Proxmox с LXC, LXD. В ервом случае: при использовании LXC-контейнеров позволяет добиться минимальных таймаутов при переключении. Во втором случае: содержит огромную библиотеку с разными дистрибутивами в большом количестве конфигураций в виде контейнеров.

## Задача 4: Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, то создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.

Ответ: 
В ситуации когда используется несколько гипервизоров основной проблемой будет миграция ВМ. 
- Потребуется гораздо больше усилий на изучение и поддержку одного и того же;  
- Высокие требования к инженерам и соответствено дополнительные расходы на  штат инженеров, чтобы закрыть потребность по используемым технологиям;  
- Потребутеся реализовывать дополнительный мониторинг;   
- Если требуется интегрировать гипервизор с какими-то внешними системами - нужно делать отдельно для каждой платформы;  
- Сложнее подбирать железо: одни вендоры поддерживают одно, другие - другое, нужно больше тратиться на резерв, проблема взаимозаменяемости.  
 

Я бы развернул максимально единообразную систему с минимумом разнообразия используемых технологий в основе. Например, Proxmox )))  