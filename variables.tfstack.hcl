variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

variable "other_id" {
  type = list(number)
  default = []
}
