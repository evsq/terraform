provider "vcd" {
    user = var.VCD_USER
    password = var.VCD_PASSWORD
    org = var.VCD_ORG
    vdc = var.VCD_VDC
    url = var.VCD_URL
    max_retry_timeout = var.vcd_max_retry_timeout
}

resource "vcd_vapp" "kubespray" {
    name = var.VCD_VAPP_NAME
    network_name = var.VCD_NET_NAME
}

resource "vcd_vapp_vm" "master1" {
    vapp_name = var.VCD_VAPP_NAME
    name = "master1"
    catalog_name = var.VCD_CATALOG_NAME
    template_name = var.VCD_TEMPLATE_VM
    memory = var.master_ram
    cpus = var.master_cpu
    initscript = "echo ${var.ROOT_PW} | passwd --stdin root; mkdir ${var.USER_DIR}/.ssh; echo ${var.SSH_KEY1} > ${var.USER_DIR}/.ssh/authorized_keys; chmod 700 ${var.USER_DIR}/.ssh; chmod 600 ${var.USER_DIR}/.ssh/authorized_keys"
    network_name = var.VCD_NET_NAME
    ip = "10.30.0.5"
    depends_on = ["vcd_vapp.kubespray"]
}

resource "vcd_vapp_vm" "worker1" {
    vapp_name = var.VCD_VAPP_NAME
    name = "worker1"
    catalog_name = var.VCD_CATALOG_NAME
    template_name = var.VCD_TEMPLATE_VM
    memory = var.worker_ram
    cpus = var.worker_cpu
    initscript = "echo ${var.ROOT_PW} | passwd --stdin root; mkdir ${var.USER_DIR}/.ssh; echo ${var.SSH_KEY1} > ${var.USER_DIR}/.ssh/authorized_keys; chmod 700 ${var.USER_DIR}/.ssh; chmod 600 ${var.USER_DIR}/.ssh/authorized_keys"
    network_name = var.VCD_NET_NAME
    ip = "10.30.0.6"
    depends_on = ["vcd_vapp.kubespray"]
}

resource "vcd_vapp_vm" "worker2" {
    vapp_name = var.VCD_VAPP_NAME
    name = "worker2"
    catalog_name = var.VCD_CATALOG_NAME
    template_name = var.VCD_TEMPLATE_VM
    memory = var.worker_ram
    cpus = var.worker_cpu
    initscript = "echo ${var.ROOT_PW} | passwd --stdin root; mkdir ${var.USER_DIR}/.ssh; echo ${var.SSH_KEY1} > ${var.USER_DIR}/.ssh/authorized_keys; chmod 700 ${var.USER_DIR}/.ssh; chmod 600 ${var.USER_DIR}/.ssh/authorized_keys"
    network_name = var.VCD_NET_NAME
    ip = "10.30.0.7"
    depends_on = ["vcd_vapp.kubespray"]
}


resource "vcd_snat" "outbound" {
    edge_gateway = var.EDGE_GATEWAY_NAME
    external_ip  = var.VCD_EXTERNAL_IP
    internal_ip  = "10.30.0.0/24"
}

resource "vcd_dnat" "m1" {
    edge_gateway = var.EDGE_GATEWAY_NAME
    external_ip  = var.VCD_EXTERNAL_IP
    port         = 2005
    internal_ip  = vcd_vapp_vm.master1.ip
    translated_port = 22
    protocol = "tcp"
}

resource "vcd_dnat" "w1" {
    edge_gateway = var.EDGE_GATEWAY_NAME
    external_ip  = var.VCD_EXTERNAL_IP
    port         = 2006
    internal_ip  = "${vcd_vapp_vm.worker1.ip}"
    translated_port = 22
    protocol = "tcp"
}

resource "vcd_dnat" "w2" {
    edge_gateway = var.EDGE_GATEWAY_NAME
    external_ip  = var.VCD_EXTERNAL_IP
    port         = 2007
    internal_ip  = "${vcd_vapp_vm.worker2.ip}"
    translated_port = 22
    protocol = "tcp"
}

resource "vcd_dnat" "api" {
    edge_gateway = var.EDGE_GATEWAY_NAME
    external_ip  = var.VCD_EXTERNAL_IP
    port         = 6443
    internal_ip  = "${vcd_vapp_vm.master1.ip}"
    translated_port = 6443
    protocol = "tcp"
}
