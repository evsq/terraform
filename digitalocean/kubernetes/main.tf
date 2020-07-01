resource "digitalocean_kubernetes_cluster" "test" {
  name    = "test"
  region  = var.REGION
  version = var.VERSION

  node_pool {
    name       = "worker-pool"
    size       = var.SIZE_NODE_POOL
    node_count = var.NODE_COUNT
  }
}

resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.test.kube_config[0].raw_config
  filename = var.KUBECONFIG_PATH
}
