variable "region" {
  type = string
}
variable "project_id" {
  type = string
}

variable "network" {
  type = string
}

variable "subnet_secondary_cidr" {
  type = list(any)
}

variable "gke_pod_range_name" {
  type = string
}
variable "gke_service_range_name" {
  type = string
}