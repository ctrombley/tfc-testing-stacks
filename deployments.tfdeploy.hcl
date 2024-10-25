deployment "single" {
  inputs = {
    prefix    = "single"
    instances = 1
  }
}

deployment "many" {
  inputs = {
    prefix    = "many"
    instances = 10
  }
}
