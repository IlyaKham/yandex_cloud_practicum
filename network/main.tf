locals {
  metadata = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${file(var.public_key_path)}"
  }
}