output "environment" {
  value = "${terraform.workspace}"
}

output "mysql internal ips" {
  value = "${join("; ", google_compute_instance.mysql.*.network_interface.0.address)}"
}

output "mysql external ips" {
  value = "${join("; ", google_compute_instance.mysql.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "sonarqube internal ips" {
  value = "${join("; ", google_compute_instance.sonarqube.*.network_interface.0.address)}"
}

output "sonarqube external ips" {
  value = "${join("; ", google_compute_instance.sonarqube.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "nexus3 external ips" {
  value = "${join("; ", google_compute_instance.nexus3.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "nexus3 internal ips" {
  value = "${join("; ", google_compute_instance.nexus3.*.network_interface.0.address)}"
}

output "consul external ips" {
  value = "${join("; ", google_compute_instance.consul.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "consul internal ips" {
  value = "${join("; ", google_compute_instance.consul.*.network_interface.0.address)}"
}

output "vault external ips" {
  value = "${join("; ", google_compute_instance.vault.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "vault internal ips" {
  value = "${join("; ", google_compute_instance.vault.*.network_interface.0.address)}"
}
