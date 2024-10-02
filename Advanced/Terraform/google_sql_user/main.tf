resource "google_sql_user" "user" {
    name = "app_user"
    instance = var.instance_uri
    password = var.password
}