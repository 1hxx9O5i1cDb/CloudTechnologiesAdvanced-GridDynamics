resource "google_service_networking_connection" "private_vpc_networking" {
    network = var.network_uri
    service = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [ var.address_name ]
}