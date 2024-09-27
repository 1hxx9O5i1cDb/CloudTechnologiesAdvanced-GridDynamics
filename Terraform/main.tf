module "google_compute_network" {
    source = "./google_compute_network"
}

module "google_compute_subnetwork" {
    source = "./google_compute_subnetwork"
    network_uri = module.google_compute_network.network_uri
    depends_on = [ module.google_compute_network ]
}

module "google_compute_firewall" {
    source = "./google_compute_firewall"
    network_uri = module.google_compute_network.network_uri
    depends_on = [ module.google_compute_subnetwork ]
}

module "google_artifact_registry_repository" {
    source = "./google_artifact_registry_repository"
    depends_on = [ module.google_compute_firewall ]
}

module "google_storage_bucket" {
    source = "./google_storage_bucket"
    depends_on = [ module.google_artifact_registry_repository ]
}

module "google_pubsub_topic" {
    source = "./google_pubsub_topic"
    depends_on = [ module.google_storage_bucket ]
}

module "google_sql_database_instance" {
    source = "./google_sql_database_instance"
    network_uri = module.google_compute_network.network_uri
    depends_on = [ module.google_pubsub_topic ]
}

module "google_sql_database" {
    source = "./google_sql_database"
    instance_uri = module.google_sql_database_instance.instance_uri
    depends_on = [ module.google_sql_database_instance ]
}

module "random_password" {
    source = "./random_password"
    depends_on = [ module.google_sql_database ]
}

module "google_sql_user" {
    source = "./google_sql_user"
    instance_uri = module.google_sql_database_instance.instance_uri
    password = module.random_password.password
    depends_on = [ module.random_password ]
}

module "google_secret_manager_secret" {
    source = "./google_secret_manager_secret"
    depends_on = [ module.google_sql_user ]
}

module "google_secret_manager_secret_version" {
    source = "./google_secret_manager_secret_version"
    secret_id = module.google_secret_manager_secret.secret_id
    password = module.random_password.password
    depends_on = [ module.google_secret_manager_secret ]
}














