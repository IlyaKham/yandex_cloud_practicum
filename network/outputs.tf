output "kms_key_id" {
  value       = yandex_kms_symmetric_key.bucket_key.id
  description = "ID ключа KMS для шифрования бакета"
}

output "kms_key_name" {
  value       = yandex_kms_symmetric_key.bucket_key.name
  description = "Имя ключа KMS"
}