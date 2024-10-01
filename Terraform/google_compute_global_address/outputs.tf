output "address_name" {
    description = "The Name of the Address"
    value = google_compute_global_address.private_ip_address.name
}