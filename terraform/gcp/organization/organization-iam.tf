resource "google_organization_iam_policy" "explicit" {
  org_id      = data.google_organization.org.org_id
  policy_data = data.google_iam_policy.explicit.policy_data
}

data "google_iam_policy" "explicit" {
  binding {
    role = "roles/resourcemanager.organizationAdmin"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/resourcemanager.folderAdmin"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/resourcemanager.projectCreator"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/orgpolicy.policyAdmin"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/iam.organizationRoleAdmin"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/billing.admin"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
  binding {
    role = "roles/owner"

    members = [
      "group:cloud@nawl.ca",
    ]
  }
}
