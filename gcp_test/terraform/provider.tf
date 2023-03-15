terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("careful-sun-379910-84e5417b71a1.json")

  project = "careful-sun-379910"
  region  = var.region
}
