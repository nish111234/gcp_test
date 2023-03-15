resource "google_compute_network" "gke-network" {
  auto_create_subnetworks         = "false"
  name                            = "gke-network"
  project                         = var.project_id
  routing_mode                    = "GLOBAL"
}

resource "google_compute_subnetwork" "gke-network-subnet" {
  ip_cidr_range              = "192.168.0.0/24"
  name                       = "gke-network-subnet"
  network                    = google_compute_network.gke-network.self_link
  secondary_ip_range         = var.subnet_secondary_cidr
  project                    = var.project_id
  region                     = var.region
}
