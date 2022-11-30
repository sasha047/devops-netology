## Домашнее задание к занятию "3.5. Файловые системы"
>Убедитесь, что у вас на новой виртуальной машине (шаг 3 задания) установлены следующие утилиты  
> - mdadm, fdisk, sfdisk, mkfs, lsblk, wget.  
>Воспользуйтесь пакетным менеджером apt для установки необходимых инструментов  
## Задание  
## 1. Узнайте о sparse (разряженных) файлах.  
Ответ: Изучил

## 2. Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?  

>Сделайте vagrant destroy на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:  
Решение:
>Сделал с версией Ubuntu 22.04
     path_to_disk_folder = './disks'
    
     host_params = {
     'disk_size' => 2560,
     'disks'=>[1, 2],
     'cpus'=>2,
     'memory'=>2048,
     'hostname'=>'sysadm-fs',
     'vm_name'=>'sysadm-fs'
     }
     Vagrant.configure("2") do |config|
     config.vm.box = "bento/ubuntu-22.04"
     config.vm.hostname=host_params['hostname']
     config.vm.provider :virtualbox do |v|

         v.name=host_params['vm_name']
         v.cpus=host_params['cpus']
         v.memory=host_params['memory']
 
         host_params['disks'].each do |disk|
             file_to_disk=path_to_disk_folder+'/disk'+disk.to_s+'.vdi'
             unless File.exist?(file_to_disk)
                 v.customize ['createmedium', '--filename', file_to_disk, '--size', host_params['disk_size']]
             end
             v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', disk.to_s, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
         end
     end
     config.vm.network "private_network", type: "dhcp"
    end
Решение:  
![Рис.3-1](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/3-1.png )  
![Рис.3-2](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/3-2.png )  
![Рис.3-3](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/3-3.png )  

>Данная конфигурация создаст новую виртуальную машину с двумя дополнительными неразмеченными дисками по 2.5 Гб.

## 4. Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.  
Решение:  
![Рис.4-1](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/4-1.png )  
![Рис.4-2](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/4-2.png )  

## 5. Используя sfdisk, перенесите данную таблицу разделов на второй диск.  
Решение:  
![Рис.5-1](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/5-1.png )  
![Рис.5-2](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/5-2.png )  

## 6. Соберите mdadm RAID1 на паре разделов 2 Гб.  
Решение:  
>Подготовим диски  

>Сначала необходимо занулить суперблоки на дисках,  
>которые мы будем использовать для построения RAID (если диски ранее использовались,   
>их суперблоки могут содержать служебную информацию о других RAID):  
  
>>mdadm --zero-superblock --force /dev/sd{b1,c1}  
  
>Занулил  суперблоки для дисков sdb1 и sdc1.  
  
>Если мы получили ответ:  
  
>>mdadm: Unrecognised md component device - /dev/sdb1  
>>mdadm: Unrecognised md component device - /dev/sdc1  

>то значит, что диски не использовались ранее для RAID. Просто продолжаем настройку.  
>Далее нужно удалить старые метаданные и подпись на дисках:  
  
>>wipefs --all --force /dev/sd{b1,c1}  
  
>Создание рейда  
  
>Для сборки избыточного массива применяем следующую команду:  

>>mdadm --create --verbose /dev/md0 -l 1 -n 2 /dev/sd{b1,c1}  
  
>* где:  
  
    /dev/md0 — устройство RAID, которое появится после сборки;   
    -l 1 — уровень RAID;   
    -n 2 — количество дисков, из которых собирается массив;   
    /dev/sd{b1,c1} — сборка выполняется из дисков sdb1 и sdc1.  
  
>Аналогично для RAID 0, только изменим диски на нужные  
>Мы увидим:  
![Рис.6](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/6.png )  
  
## 7. Соберите mdadm RAID0 на второй паре маленьких разделов.  
Решение:  
![Рис.7](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/7.png )  

## 8. Создайте 2 независимых PV на получившихся md-устройствах.  
Решение:  
![Рис.8](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/8.png )  

## 9. Создайте общую volume-group на этих двух PV.  
![Рис.9](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/9.png )  

## 10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.
![Рис.10](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/10.png )  

## 11. Создайте mkfs.ext4 ФС на получившемся LV.  
![Рис.11](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/11.png )  

## 12. Смонтируйте этот раздел в любую директорию, например, /tmp/new.  
![Рис.12-1](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/12-1.png )  
![Рис.12-2](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/12-2.png )  

## 13. Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz.  
![Рис.13](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/13.png )  

## 14. Прикрепите вывод lsblk.  
![Рис.14](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/14.png )  

## 15.Протестируйте целостность файла:  
![Рис.15](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/15.png )  

    root@vagrant:~# gzip -t /tmp/new/test.gz  
    root@vagrant:~# echo $?  
    0  
## 16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.  
![Рис.16](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/16.png )  

## 17. Сделайте --fail на устройство в вашем RAID1 md.  
![Рис.17](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/17.png )  

## 18. Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.  
![Рис.18](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/18.png )  

## 19. Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:  
![Рис.19](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/19.png )  

    root@vagrant:~# gzip -t /tmp/new/test.gz  
    root@vagrant:~# echo $?  
    0  
## 20. Погасите тестовый хост, vagrant destroy.  
![Рис.20](https://github.com/sasha047/devops-netology/blob/main/dz3-5/img/20.png )  
