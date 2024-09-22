output "network_uri" {
    description = "The URI of the Network"
    value = google_compute_network.network.self_link
}