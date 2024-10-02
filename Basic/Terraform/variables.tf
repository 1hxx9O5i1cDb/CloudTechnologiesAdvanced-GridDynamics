variable "gcp_region" {
    description = "The GCP Region where resources will be created"
    type = string
    default = "europe-central2"
}

variable "project_name" {
    description = "The Project where resources will be created"
    type = string
    default = "gd-gcp-gridu-devops-t1-t2"
}