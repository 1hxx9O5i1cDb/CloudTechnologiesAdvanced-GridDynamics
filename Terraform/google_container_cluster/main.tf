resource "google_container_cluster" "cluster" {
    name = "k8s-cluster"
    description = "K8S"
    location = "europe-central2"    # Regional Cluster
    initial_node_count = 3 # 1 ?
    network = var.network_uri
    subnetwork = var.subnetwork_uri

    private_cluster_config {
        enable_private_nodes = true
        enable_private_endpoint = false # Public API Access
        master_ipv4_cidr_block = "10.0.0.0/28"    # Cluster Control Plane IP Range
        
        master_global_access_config {
            enabled = true
        }
    }

    master_authorized_networks_config {
        cidr_blocks {
            cidr_block = "0.0.0.0/0"    # Public API Access
            display_name = "public-access"
        }
    }

    ip_allocation_policy {
        // ##
    }

    addons_config {
        http_load_balancing {
            disabled = false
        }

        horizontal_pod_autoscaling {
            disabled = false
        }
    }

    binary_authorization {
        evaluation_mode = "DISABLED"
    }

    remove_default_node_pool = true

    node_locations = [ "europe-central2-a", "europe-central2-b", "europe-central2-c" ]  ## High Availability Settings (3 Zones)

    logging_service = "logging.googleapis.com/kubernetes"   ## Enable Logging and Monitoring
    monitoring_service = "monitoring.googleapis.com/kubernetes" ## Enable Logging and Monitoring
}