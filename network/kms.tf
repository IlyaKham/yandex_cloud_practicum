# Создание ключа шифрования в KMS

resource "yandex_kms_symmetric_key" "bucket_key" {
  name              = "bucket-encryption-key"
  description       = "Ключ для шифрования содержимого бакета"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"  # Ротация раз в год
  
  deletion_protection = false
}

# Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa_encrypter_decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${var.service_account_id}"
}