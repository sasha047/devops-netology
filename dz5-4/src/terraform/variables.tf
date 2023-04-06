# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gi1og7mh436qoinci3"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gqdc8n6ve4seeukhei"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd80le4b8gt2u33lvubr"
}

# Зона адресов
variable "yandex_zone"   {
  default = "ru-central1-a"
}

#variable "gce_ssh_user"  {
#  default = "centos"
#}

#variable "gce_ssh_pub_key_file"  {
#  default = "/home/bav/devops-netology/devops-netology/dz5-4/id_rs_yandex_cloud.pub"
#}
