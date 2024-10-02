terraform {
    required_version = "~> 1.5.7"

    required_providers {
        google = {
            source = "hashicorp/google"
            version = "6.2.0"
        }
    }
}

provider "google" {
    region = var.gcp_region
    project = var.project_name

    add_terraform_attribution_label = false
}