#Обьявление переменных для использования
locals {
  vm_user = "alex"
  vpc_name = "network_for_nodes"
  subnet_cidrs = ["172.18.100.0/24"]
  subnet_name = "subnet_for_nodes"
}
#Параметры создания облачной сети
resource "yandex_vpc_network" "my_net" {
  name = local.vpc_name
}
#Параметры создания облачной подсети
resource "yandex_vpc_subnet" "my_subnet" {
  v4_cidrs_blocks = local.subnet_cidrs
  zone = var.zone
  name = local.subnet_name
  network_id = yandex_vpc_network.my_net.id
}
#Параметры модуля балансировщика. Все конфигурация будет находиться в папке modules/instances
module "balancer" {
    source = "./modules/instances"
    count = 1
    vm_name = "balancer -${count.index +1}"
    vpc_name = local.vpc_name
    subnet_cidrs = yandex_vpc_subnet.my_subnet.v4_cidrs_blocks
    subnet_name = yandex_vpc_subnet.my_subnet.name
    subnet_id = yandex_vpc_subnet.my_subnet.index
    vm_user = local.vm_user
  
}
#Параметры модуля 2х backend. Все конфигурация будет находиться в папке modules/instances
module "backends" {
    source = "./module/instances"
    count = 2
    vm_name = "backend - ${count.index +1}"
    vpc_name = local.vpc_name
    subnet_cidrs = yandex_vpc_subnet.my_subnet.v4_cidrs_blocks
    subnet_name = yandex_vpc_subnet.my_subnet.name
    subnet_id = yandex_vpc_subnet.my_subnet.index
    vm_user = local.vm_user
  
}
#Параметры модуля databases. Все конфигурация будет находиться в папке modules/instances
module "databases" {
  source = "./modules/instances"

  count = 1

  vm_name = "database-${count.index + 1}"
  vpc_name = local.vpc_name
  subnet_cidrs = yandex_vpc_subnet.subnet.v4_cidr_blocks
  subnet_name = yandex_vpc_subnet.subnet.name
  subnet_id = yandex_vpc_subnet.subnet.id
  vm_user = local.vm_user
}
resource "local_file" "inventory_file" {
  content = templatefile("${path.module}/templates/inventory.tpl",
    {
      loadbalancers = module.loadbalancers
      backends      = module.backends
      databases     = module.databases
    }
  )
  filename = "${path.module}/inventory.ini"
}

resource "local_file" "group_vars_all_file" {
  content = templatefile("${path.module}/templates/group_vars_all.tpl",
    {
      loadbalancers = module.loadbalancers
      backends      = module.backends
      databases     = module.databases
    }
  )
  filename = "${path.module}/group_vars/all/main.yml"
}