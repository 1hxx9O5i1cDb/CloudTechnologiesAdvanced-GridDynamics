resource "google_storage_bucket_object" "bucket_object" {
    name = "message_function"
    bucket = var.bucket_name
    source = "${path.module}/function_code.zip"
}