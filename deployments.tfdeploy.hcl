deployment "single" {
  inputs = {
    prefix    = "single"
    instances = 1
  }
}

publish_output "single" {
  value = deployment.single.id
}

deployment "many" {
  inputs = {
    prefix    = "many"
    instances = 10
  }
}

upstream_input "single" {
  type = "stack"
  source = "host-name/org-name/project-name/stack-name"
}
