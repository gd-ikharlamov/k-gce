provider "google" {
  credentials = "${file("terraform-gce-account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
