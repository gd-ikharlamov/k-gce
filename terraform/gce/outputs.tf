output "environment" {
  value = "${terraform.workspace}"
}

output "mysql internal ip" {
  value = "${google_compute_instance.mysql.network_interface.0.address}"
}

output "sonarqube internal ips" {
  value = "${join(",", google_compute_instance.sonarqube.*.network_interface.0.address)}"
}
