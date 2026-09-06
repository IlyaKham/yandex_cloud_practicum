# instance_group.tf
# Группа ВМ с LAMP для задания

resource "yandex_compute_instance_group" "lamp-group" {
  name                = "lamp-group"
  folder_id           = var.folder_id
  service_account_id  = var.service_account_id
    

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"  # LAMP образ
        size     = 10
        type     = "network-hdd"
      }
    }

    network_interface {
      network_id = yandex_vpc_network.my-vpc.id
      subnet_ids = [yandex_vpc_subnet.public.id]
      nat        = true  # Публичный IP для каждой ВМ
    }

    # Metadata с user-data для создания веб-страницы
    metadata = local.lamp_metadata

    network_settings {
      type = "STANDARD"
    }
    
    scheduling_policy {
    preemptible = true  # Прерываемые ВМ дешевле
  }
  }

  # Масштабирование: фиксированный размер 3 ВМ
  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  # Размещение в зоне
  allocation_policy {
    zones = [var.default_zone_a]
  }

  # Политика развёртывания
  deploy_policy {
    max_unavailable = 1
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
    startup_duration = 60
    strategy        = "proactive"
  }

  # Проверка состояния ВМ (health check)
  health_check {
    interval            = 30
    timeout             = 10
    unhealthy_threshold = 3
    healthy_threshold   = 2
    
    http_options {
      port = 80
      path = "/"
    }
  }

  # Привязка к балансировщику
  load_balancer {
    target_group_name        = "lamp-target-group"
    target_group_description = "Target group for LAMP instances"
  }
}