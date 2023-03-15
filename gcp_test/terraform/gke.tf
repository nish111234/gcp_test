
resource "google_container_cluster" "private" {
  name                     = "my-gke-cluster"
  location                 = var.region
  initial_node_count       = 1
  project                  = var.project_id
  remove_default_node_pool = true
  network                  = var.network
  subnetwork = google_compute_subnetwork.gke-network-subnet.self_link
  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = "192.168.0.0/28"
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = var.gke_pod_range_name
    services_secondary_range_name = var.gke_service_range_name
  }
}

resource "google_container_node_pool" "primary-node" {
  name       = "my-node-pool1"
  location   = var.region
  cluster    = google_container_cluster.private.name
  node_count = 3
  node_config {
    service_account = "gcp-test@careful-sun-379910.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

}

resource "google_container_node_pool" "secondary-node" {
  name     = "my-node-pool2"
  location = var.region
  cluster  = google_container_cluster.private.name
  node_config {
    preemptible     = true
    service_account = "gcp-test@careful-sun-379910.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  autoscaling {
    max_node_count = 4
  }
}
