resource "yandex_storage_bucket" "images" {
  bucket   = "${var.student_name}-${formatdate("YYYY-MM-DD", timestamp())}"
  max_size = 1 * 1024 * 1024 * 1024

  # Шифрование содержимого бакета
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  depends_on = [
    yandex_kms_symmetric_key.bucket_key,
    yandex_resourcemanager_folder_iam_member.sa_encrypter_decrypter
  ]
}

resource "yandex_storage_object" "image" {
  bucket       = yandex_storage_bucket.images.bucket
  key          = "images/photo.jpg"
  source       = var.image_source_path
  acl          = "public-read"
  content_type = "image/jpeg"
}



locals {
  image_url = "https://storage.yandexcloud.net/${yandex_storage_bucket.images.bucket}/images/photo.jpg"
}