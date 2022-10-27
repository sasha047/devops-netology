# devops-netology
#Домашнее задание к занятию «2.1. Системы контроля версий»

# Игнор лист файлов проекта (.gitignore)

##В подкаталоге .terraform игнорировать все файлы и директории

*/.terraform/


##Игнорируем файлы по типу (расширению) во всех дирректориях:

*.tfstate
*.tfvars
*.tfvars.json
*_override.tf
*_override.tf.json
*.tfstate.*

##Игнорирование файла во всех директориях

crash.log
override.tf
terraform.rc
.terraformrc

##Игнорировать файлы которые начинаются на crash. и заканчиваются на .log

crash.*.log
