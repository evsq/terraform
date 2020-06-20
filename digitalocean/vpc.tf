resource "digitalocean_vpc" "test" {
  name     = "test"
  region   = var.REGION
  ip_range = "10.50.0.0/24"
}