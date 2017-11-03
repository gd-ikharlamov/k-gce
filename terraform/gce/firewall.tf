resource "google_compute_firewall" "sonarqube" {
  name    = "sonarqube"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }

  target_tags = ["sonarqube"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "mysql" {
  name    = "mysql"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  target_tags = ["mysql"]
  source_ranges = ["10.156.0.0/16"]
}
