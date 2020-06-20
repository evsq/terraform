variable "TOKEN" {
  type = string
  default = ""
}

variable "SSH_FINGERPRINT" {
  type = string
  default = ""
}

variable "SSH_PRIVATE_KEY" {
  type = string
  default = "~/.ssh/id_rsa"
}

variable "SSH_PUBLIC_KEY" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "REGION" {
  type = string
  default = "ams3"
}