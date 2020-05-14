resource "google_storage_bucket" "terraform_nawl_migration" {
  name               = "terraform-nawl-migration"
  location           = local.region
  bucket_policy_only = "true"
  requester_pays     = true
  force_destroy      = false
  storage_class      = "STANDARD"
}

data "google_iam_policy" "gcs_nawl_migration" {
  binding {
    role = "roles/storage.admin"
    members = [
      "group:cloud@nawl.ca",
    ]
  }
}

resource "google_storage_bucket_iam_policy" "gcs_nawl_migration" {
  bucket      = google_storage_bucket.terraform_nawl_migration.name
  policy_data = data.google_iam_policy.gcs_nawl_migration.policy_data
}
