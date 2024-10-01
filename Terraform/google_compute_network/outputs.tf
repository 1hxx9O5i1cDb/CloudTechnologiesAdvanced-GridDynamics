output "network_uri" {
    description = "The URI of the Network"
    value = google_compute_network.network.self_link
}

output "network_name" {
    description = "The Name of the Network"
    value = google_compute_network.network.name
}