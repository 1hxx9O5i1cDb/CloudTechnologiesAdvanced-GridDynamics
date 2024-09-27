resource "google_sql_database" "database" {
    name = "app_db"
    instance = var.instance_uri
}