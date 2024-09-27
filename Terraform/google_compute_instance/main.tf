resource "google_compute_instance" "instance" {
    name = "bastion-host"
    description = "Bastion Host | MySQL"
    machine_type = "e2-micro"
    zone = "europe-west2-a"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
        }
    }

    network_interface {
        network = var.network_uri

        access_config {
            // Ephemeral Public IP
        }
    }

    tags = [ "bastion-host" ]

    metadata_startup_script = file("${path.module}/resources/script.sh")
}