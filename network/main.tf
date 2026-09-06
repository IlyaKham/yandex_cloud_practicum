locals {
  # Базовая metadata
  base_metadata = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${file(var.public_key_path)}"
  }

  # Собираем metadata для LAMP группы
  lamp_metadata = merge(local.base_metadata, {
    user-data = templatefile("${path.module}/user_data.sh.tpl", {
      image_url = local.image_url  # ← Теперь определён
    })
  })
}