terraform {
    required_version = "~> 1.5.7"

    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 6.4.0"
        }
    }
}

provider "google" {
    project = var.gcp_project_name
    region = var.gcp_region

    add_terraform_attribution_label = false
}