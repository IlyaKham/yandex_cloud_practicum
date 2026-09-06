resource "yandex_storage_bucket" "images" {
  bucket = "${var.student_name}-${formatdate("YYYY-MM-DD", timestamp())}"
  max_size = 1 * 1024 * 1024 * 1024
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.images.bucket
  key    = "images/photo.jpg"
  source = var.image_source_path
  acl    = "public-read"  # Объект публичный
  content_type = "image/jpeg"
}

locals {
  image_url = "https://storage.yandexcloud.net/${yandex_storage_bucket.images.bucket}/images/photo.jpg"
}