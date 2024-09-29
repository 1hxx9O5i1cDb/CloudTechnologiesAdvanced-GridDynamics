# resource "google_logging_metric" "k8s_metric_filter" {
#     name = "k8s-metric-filter"
#     filter = "resource.type = \"k8s_container\" AND logName=\"projects/${var.gcp_project_name}/logs/requests\""
# }