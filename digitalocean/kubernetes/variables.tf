# Should be provided in TF_VAR_do_token environment variable
variable "do_token" {
  type = string
  default = ""
}

variable "REGION" {
  type = string
  default = "ams3"
}

variable "VERSION" {
    type = string
    default = "1.18.3-do.0"
}

variable "SIZE_NODE_POOL" {
    type = string
    default = "s-4vcpu-8gb"
}

variable "NODE_COUNT" {
    type = string
    default = "1"
}
