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

resource "google_compute_firewall" "allow_http" {
    name = "allow-http"
    description = "Allow HTTP"
    network = var.network_uri

    allow {
        protocol = "tcp"
        ports = [ "80" ]
    }

    source_ranges = [ "0.0.0.0/0" ]
}

resource "google_compute_firewall" "allow_https" {
    name = "allow-https"
    description = "Allow HTTPS"
    network = var.network_uri

    allow {
        protocol = "tcp"
        ports = [ "443" ]
    }

    source_ranges = [ "0.0.0.0/0" ]
}