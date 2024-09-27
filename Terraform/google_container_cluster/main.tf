resource "google_container_cluster" "cluster" {
    name = "k8s-cluster"
    description = "K8S"
    location = "europe-central2"    # Regional Cluster
    initial_node_count = 3
    network = var.network_uri
    subnetwork = var.subnetwork_uri

    private_cluster_config {
        enable_private_nodes = true
        enable_private_endpoint = false # Public API Access
        master_ipv4_cidr_block = "172.16.0.0/28"    # Cluster Control Plane IP Range
    }

    ip_allocation_policy {
        #
    }

    addons_config {
        http_load_balancing {
            disabled = false
        }
    }

    ## High Availability Settings (3 Zones)
    node_locations = [ "europe-central2-a", "europe-central2-b", "europe-central2-c" ]

    ## Enable Logging and Monitoring
    logging_service = "logging.googleapis.com/kubernetes"
    monitoring_service = "monitoring.googleapis.com/kubernetes"
}