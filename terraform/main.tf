provider "google" {
  project = "tis-cc-challenge"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "dev-l" {
  count        = 2
  name         = "dev-l-${count.index}"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
resource "google_compute_instance" "dev-w" {
  count        = 2
  name         = "dev-w-${count.index}"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "windows-server-2016-dc-v20220414"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}