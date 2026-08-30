# VPC
resource "yandex_vpc_network" "my-vpc" {
  name = "my-vpc"
}

# Публичная подсеть
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.my-vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Таблица маршрутизации
resource "yandex_vpc_route_table" "nat-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.my-vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"  # IP NAT-инстанса
  }
}

# Приватная подсеть (сразу с маршрутом)
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.my-vpc.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.nat-route.id
}