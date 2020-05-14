resource "google_project_organization_policy" "bool-policies" {
  for_each = {
    "iam.disableServiceAccountCreation" : false,
    "iam.disableServiceAccountKeyCreation" : false,
    "compute.disableGuestAttributesAccess" : false,
    "compute.requireShieldedVm" : false,
  }
  project    = local.project
  constraint = format("constraints/%s", each.key)
  boolean_policy {
    enforced = each.value
  }
}

resource "google_project_organization_policy" "list-policies-allow" {
  project = local.project
  for_each = toset([
    "compute.vmExternalIpAccess",
    "serviceuser.services"
  ])
  constraint = format("constraints/%s", each.value)

  list_policy {
    inherit_from_parent = false
    allow {
      all = true
    }
  }
}

resource "google_project_organization_policy" "list-policies-values" {
  project = local.project
  for_each = {
    "compute.trustedImageProjects" : [
      "projects/click-to-deploy-images",
    ],
    "gcp.resourceLocations" : [
      "in:northamerica-northeast1-locations",
    ],
  }
  constraint = format("constraints/%s", each.key)
  list_policy {
    inherit_from_parent = true
    allow {
      values = each.value
    }
  }
}
