terraform {
  backend "remote" {
    organization = "example-org-332e55"

    workspaces {
      name = "Task-1"
    }
  }
}