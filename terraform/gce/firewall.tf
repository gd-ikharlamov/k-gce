resource "google_compute_firewall" "default" {
  name    = "sonar"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }

  target_tags = ["sonarqube"]
  source_ranges = ["0.0.0.0/0"]
}
