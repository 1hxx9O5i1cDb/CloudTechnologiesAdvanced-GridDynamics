output "instance_uri" {
    description = "The URI of the Instance"
    value = google_sql_database_instance.instance.self_link
}