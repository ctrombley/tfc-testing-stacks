identity_token "test" {
  audience = ["test.workload.identity"]
}

deployment "single" {
  inputs = {
    prefix    = "single"
    instances = 2
  }
}

deployment "many" {
  inputs = {
    prefix    = "many"
    instances = 11
    other_id  = upstream_input.other.id
  }
}

publish_output "db_user" {
  value = deployment.single.username
}

upstream_input "other" {
  type = "stack"
  source = "app.terraform.io/org-name/proj-name/other"
}
