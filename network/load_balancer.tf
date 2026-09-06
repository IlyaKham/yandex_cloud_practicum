# load_balancer.tf
# Сетевой балансировщик для группы ВМ

resource "yandex_lb_network_load_balancer" "lamp-lb" {
  name = "lamp-load-balancer"

  listener {
    name = "lamp-listener"
    port = 80
    target_port = 80
    
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp-group.load_balancer[0].target_group_id

    healthcheck {
      name                = "http"
      interval            = 30
      timeout             = 10
      healthy_threshold   = 2
      unhealthy_threshold = 3
      
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

output "load_balancer_ip" {
  value = [
    for listener in yandex_lb_network_load_balancer.lamp-lb.listener : 
    [
      for spec in listener.external_address_spec : 
      spec.address
    ][0]
  ][0]
}