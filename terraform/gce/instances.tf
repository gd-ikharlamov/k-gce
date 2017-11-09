resource "google_compute_instance" "mysql" {
  count        = 1
  name         = "mysql-${terraform.workspace}"
  machine_type = "${var.machine_type}"
  zone         = "${element(var.zones, count.index)}"
  tags         = ["mysql"]

  boot_disk {
    initialize_params {
      image = "k-gce-mysql"
    }
  }

  network_interface {
    network       = "${var.network}"
    access_config = {}
  }

  metadata {
    "ssh-keys" = "ikharlamov:${var.ssh_keys["ikharlamov"]}\ntest:${var.ssh_keys["test"]}"
  }
}

resource "google_compute_instance" "sonarqube" {
  depends_on   = ["google_compute_instance.mysql"]
  count        = 1
  name         = "sonarqube-${terraform.workspace}"
  machine_type = "${var.machine_type}"
  zone         = "${element(var.zones, count.index)}"
  tags         = ["sonarqube"]

  boot_disk {
    initialize_params {
      image = "k-gce-sonarqube"
    }
  }

  network_interface {
    network       = "${var.network}"
    access_config = {}
  }

  metadata {
    "ssh-keys" = "centos:${file("~/.ssh/ikharlamov-nb.pub")}"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = "${file("~/.ssh/ikharlamov-nb")}"
      agent       = "false"
    }

    inline = [
      "sudo sed 's/mysql:3306/${google_compute_instance.mysql.network_interface.0.address}:3306/g' -i /opt/sonarsource/sonarqube-5.6.7/conf/sonar.properties",
      "sudo systemctl reboot sonarqube.service",
    ]
  }
}

resource "google_compute_instance" "consul" {
  count        = 3
  name         = "consul-server-${count.index}"
  machine_type = "${var.machine_type_consul}"
  zone         = "${element(var.zones, count.index)}"
  tags         = ["consul", "consul-server"]

  boot_disk {
    initialize_params {
      image = "k-gce-consul"
    }
  }

  network_interface {
    network       = "${var.network}"
    access_config = {}
  }

  metadata {
    "ssh-keys" = "ikharlamov:${var.ssh_keys["ikharlamov"]}"
  }

  service_account {
    scopes = ["compute-ro"]
  }

  provisioner "local-exec" {
    command = "cd ansible; ansible-playbook -u ikharlamov --private-key ~/.ssh/ikharlamov-nb -i '${self.network_interface.0.access_config.0.assigned_nat_ip},' consul-server.yml"
  }
}
