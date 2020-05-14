resource "google_service_account" "igm" {
  account_id   = format("%s-igm", var.name)
  display_name = "service account for ${var.name} GCE Shielded VM"
}

resource "google_project_iam_member" "sd" {
  for_each = var.enable_stackdriver ? toset([
    "roles/logging.logWriter",
    "roles/cloudtrace.agent",
    "roles/clouddebugger.agent",
    "roles/cloudprofiler.agent",
    "roles/errorreporting.writer",
    # "roles/monitoring.metricWriter",
  ]) : []
  role   = format("%s", each.key)
  member = format("serviceAccount:%s", google_service_account.igm.email)
}

output "service_account" {
  value = {
    email = google_service_account.igm.email,
    name  = google_service_account.igm.name
  }
}

resource "google_storage_bucket_iam_member" "bucket_access" {
  for_each = var.bucket_access ? toset(["cheatcodes"]) : []
  bucket   = var.bucket
  role     = "roles/storage.objectViewer"
  member   = format("serviceAccount:%s", google_service_account.igm.email)
  depends_on = [
    google_service_account.igm
  ]
}
