resource "digitalocean_droplet" "master" {
    image = "centos-7-x64"
    name = "master"
    region = var.REGION
    size = "s-4vcpu-8gb"
    private_networking = true
    vpc_uuid = digitalocean_vpc.test.id
    ssh_keys = [
      var.SSH_FINGERPRINT
    ]
  # connection {

  #   host = self.ipv4_address
  #   user = "root"
  #   type = "ssh"
  #   private_key = file(var.SSH_PRIVATE_KEY)
  #   timeout = "2m"
  # }
  # provisioner "remote-exec" {
  #   inline = [
  #     "export PATH=$PATH:/usr/bin",

  #     "yum update -y",
  #     "yum install epel-release -y",
  #     "sudo yum -y install nginx",
  #     "systemctl enable --now nginx"
  #   ]
  # }
}

output "master_ip" {
    value = "${digitalocean_droplet.master.ipv4_address}"
}

resource "digitalocean_droplet" "node1" {
    image = "centos-7-x64"
    name = "node1"
    region = var.REGION
    size = "s-4vcpu-8gb"
    private_networking = true
    vpc_uuid = digitalocean_vpc.test.id
    ssh_keys = [
      var.SSH_FINGERPRINT
    ]
}

output "node1_ip" {
    value = "${digitalocean_droplet.node1.ipv4_address_private}"
}