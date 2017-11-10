resource "google_compute_firewall" "sonarqube" {
  name    = "${var.network}-sonarqube"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }

  target_tags   = ["sonarqube"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "mysql" {
  name    = "${var.network}-mysql"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  target_tags   = ["mysql"]
  source_ranges = ["10.156.0.0/16"]
}

resource "google_compute_firewall" "consul" {
  name    = "${var.network}-consul"
  network = "${var.network}"

  allow {
    protocol = "tcp"

    ports = [
      "8300",
      "8301",
      "8302",
      "8500",
      "8600",
    ]
  }

  allow {
    protocol = "udp"

    ports = [
      "8301",
      "8302",
      "8600",
    ]
  }

  target_tags   = ["consul"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "vault" {
  name    = "${var.network}-vault"
  network = "${var.network}"

  allow {
    protocol = "tcp"

    ports = [
      "8200",
      "8201"
    ]
  }

  target_tags   = ["vault"]
  source_ranges = ["0.0.0.0/0"]
}
