variable "secure_source_manager_repository_iam_members" {
  description = <<EOT
Map of secure_source_manager_repository_iam_members, attributes below
Required:
    - member
    - repository_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member        = string
    repository_id = string
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

