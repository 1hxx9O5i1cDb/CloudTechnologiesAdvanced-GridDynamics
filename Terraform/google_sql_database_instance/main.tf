resource "google_sql_database_instance" "instance" {
    name = "k8s-sql-instance"
    region = "europe-west2"
    database_version = "MYSQL_8_0"

    settings {
        tier = "db-f1-micro"
        availability_type = "REGIONAL"
        
        backup_configuration {
            enabled = false
        }

        ip_configuration {
            private_network = var.network_uri
        }
    }
}