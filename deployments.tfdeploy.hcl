identity_token "test" {
  audience = ["test.workload.identity"]
}

deployment "single" {
  inputs = {
    prefix    = "single"
    instances = 2
    other_id  = upstream_input.pet_nulls.picked_key_of_simple_deploy
  }
}

deployment "many" {
  inputs = {
    prefix    = "many"
    instances = 11
    other_id  = upstream_input.pet_nulls.picked_index_of_complex_deploy
  }
}

publish_output "db_user" {
  value = "user"
}

upstream_input "pet_nulls" {
  type = "stack"
  source = "app.terraform.io/hashicorp/stacks/pet-nulls-stack-parent"
}
