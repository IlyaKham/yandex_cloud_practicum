# Базовые переменные для провайдера
variable "cloud_id" {
  type        = string
  description = "YC Cloud ID"
}

variable "service_account_id" {
  type        = string
  description = "Service account ID for instance group"
}

variable "folder_id" {
  type        = string
  description = "YC Folder ID"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
}

variable "service_account_key_path" {
  type        = string
  description = "Path to service account JSON key"
}

# SSH-ключи
variable "public_key_path" {
  type        = string
  description = "Path to public SSH key"
}


# Прерываемость ВМ
variable "preemptible" {
  type        = bool
  default     = true
  description = "Use preemptible VMs for cost savings"
}

# Конфигурация тестовых ВМ
variable "test_vms" {
  type = map(object({
    cpu         = number
    ram         = number
    disk_volume = number
    is_public   = bool
  }))
  default = {
    "test-vm-public" = {
      cpu         = 2
      ram         = 2
      disk_volume = 10
      is_public   = true
    }
    "test-vm-private" = {
      cpu         = 2
      ram         = 2
      disk_volume = 10
      is_public   = false
    }
  }
  description = "Configuration for test VMs"
}


variable "student_name" {
  type        = string
  description = "Your name for bucket naming"
  default     = "khamuro"
}

variable "image_source_path" {
  type        = string
  description = "Local path to image file"
  default     = "/home/khamuro/yandex_cloud_practicum/kotik.jpg" 
}