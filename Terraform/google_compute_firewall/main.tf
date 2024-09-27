resource "google_compute_firewall" "allow_bastion_sql" {
    name = "allow-bastion-sql"
    description = "Bastion Host - MySQL"
    network = var.network_uri

    allow {
        protocol = "tcp"
        ports = [ "22" ]
    }

    source_tags = [ "bastion-host" ]
    target_tags = [ "sql-server" ]
}