variable "VCD_USER" {
    type = string
    default = "someuser"
}
# Should be provided in TF_VAR_VCD_PASSWORD environment variable
variable "VCD_PASSWORD" {
    default = "***"
}

variable "VCD_ORG" {
  type = "string"
  default = "someORG"
}

variable "VCD_VDC" {
  type = "string"
  default = "someVDC"
}

variable "VCD_URL" {
  type = "string"
  default ="https://someurl/api"
}

variable "EDGE_GATEWAY_NAME" {
    type = "string"
    default = "some-EdgeGW"
}

variable "VCD_VAPP_NAME" {
  type = "string"
  default = "kubespray"
}

variable "VCD_NET_NAME" {
  type = "string"
  default = "kubespray"
}

variable "VCD_EXTERNAL_IP" {
  type = "string"
  default = "1.1.1.1"
}

variable "vcd_max_retry_timeout" {
   description = "Retry Timeout"
   default = "20"
}

variable "VCD_CATALOG_NAME" {
    type = "string"
    default = "Linux"
}

variable "VCD_TEMPLATE_VM" {
    type = "string"
    default = "CentOS-7"
}

variable "ROOT_PW" {
  type = "string"
  default = "somePW"
}

variable "master_ram" {
    type = "string"
    default = "4096"
}

variable "master_cpu" {
    type = "string"
    default = "4"
}

variable "worker_ram" {
    type = "string"
    default = "4096"
}

variable "worker_cpu" {
    type = "string"
    default = "4"
}

variable "k8s_api_port_int" {
    type = "string"
    default = "6443"
}

variable "SSH_KEY1" {
  type = "string"
  default = "someKey"
}

variable "USER_DIR" {
  type = "string"
  default = "/root"
}
