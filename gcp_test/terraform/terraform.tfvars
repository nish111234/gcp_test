region     = "europe-west2"
project_id = "careful-sun-379910"
network    = "https://www.googleapis.com/compute/v1/projects/careful-sun-379910/global/networks/gke-network"
subnet_secondary_cidr = [
  {
    range_name    = "pod"
    ip_cidr_range = "10.0.1.0/24"
  },
  {
    range_name    = "service"
    ip_cidr_range = "10.4.1.0/24"
  }
]
gke_pod_range_name                      = "pod"
gke_service_range_name                  = "service"