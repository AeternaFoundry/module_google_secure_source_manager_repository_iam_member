resource "google_secure_source_manager_repository_iam_member" "secure_source_manager_repository_iam_members" {
  for_each = var.secure_source_manager_repository_iam_members

  member        = each.value.member
  repository_id = each.value.repository_id
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

