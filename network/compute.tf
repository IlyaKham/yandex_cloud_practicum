# Получение образа Ubuntu
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

# NAT-инстанс
resource "yandex_compute_instance" "nat-instance" {
  name        = "nat-instance"
  zone        = var.default_zone_a
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
    ip_address         = "192.168.10.254"
    nat                = true
  }
  
  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = local.metadata
}

# Тестовая ВМ в публичной подсети
resource "yandex_compute_instance" "test-vm-public" {
  name        = "test-vm-public"
  zone        = var.default_zone_a
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = local.metadata
}

# Тестовая ВМ в приватной подсети
resource "yandex_compute_instance" "test-vm-private" {
  name        = "test-vm-private"
  zone        = var.default_zone_a
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }

  network_interface {
  subnet_id = yandex_vpc_subnet.private.id  # ← Используем private
  nat       = false
  }

  scheduling_policy {
    preemptible = var.preemptible
  }
  metadata = local.metadata

}