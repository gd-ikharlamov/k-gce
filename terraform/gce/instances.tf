resource "google_compute_instance" "mysql" {
  name         = "mysql"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}"

  boot_disk {
    initialize_params {
      image = "k-gce-mysql"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
}

resource "google_compute_instance" "sonarqube" {
  depends_on   = ["google_compute_instance.mysql"]
  name         = "sonarqube"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}"

  boot_disk {
    initialize_params {
      image = "k-gce-sonarqube"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
}
