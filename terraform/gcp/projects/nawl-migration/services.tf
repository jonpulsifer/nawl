resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com"
  ])
  service            = each.key
  disable_on_destroy = false
}
