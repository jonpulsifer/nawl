module "nawl_migration" {
  source          = "github.com/jonpulsifer/terraform-modules//gcp-project"
  project_id      = "nawl-migration"
  folder_id       = google_folder.production.name
  billing_account = data.google_billing_account.jonathans.id
  compute         = true
  labels = {
    environment = "production"
  }
}
