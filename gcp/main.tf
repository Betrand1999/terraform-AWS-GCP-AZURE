terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }

  backend "gcs" {
    bucket      = "mutaghagcpstatebucket"                                 # Replace with your GCS bucket name
    prefix      = "terraform/state"                                       # Prefix for storing state files
    credentials = "~/.config/gcloud/application_default_credentials.json" # Path to your credentials file
  }
}

provider "google" {
  credentials = file("~/.config/gcloud/application_default_credentials.json") # Path to your service account JSON key
  project     = "main-nucleus-418523"                                         # Replace with your GCP project ID
  region      = "us-central1"                                                 # Replace with your preferred region
  zone        = "us-central1-a"                                               # Replace with your preferred zone
}

resource "google_compute_instance" "example-vm" {
  name         = "example-vm"
  machine_type = "e2-medium"     # VM machine type
  zone         = "us-central1-a" # Zone must match the provider zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Base image for the VM
    }
  }

  network_interface {
    network = "default" # Default network
    access_config {}    # Automatically assigns a public IP
  }
}
