variable "gcp_region" {
    description = "The GCP Region where resources will be created"
    type = string
    sensitive = true
    default = "europe-central2"
}

variable "gcp_project_name" {
    description = "The Project where resources will be created"
    type = string
    sensitive = true
    default = "gd-gcp-gridu-devops-t1-t2"
}