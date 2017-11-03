resource "google_compute_instance" "mysql" {
  name         = "mysql-${terraform.workspace}"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}"
  tags         = ["mysql"]

  boot_disk {
    initialize_params {
      image = "k-gce-mysql"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    "ssh-keys" = "ikharlamov:${var.ssh_keys["ikharlamov"]}\ntest:${var.ssh_keys["test"]}"
  }
}

resource "google_compute_instance" "sonarqube" {
  depends_on   = ["google_compute_instance.mysql"]
  name         = "sonarqube-${terraform.workspace}"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}"
  tags         = ["sonarqube"]

  boot_disk {
    initialize_params {
      image = "k-gce-sonarqube"
    }
  }

  network_interface {
    network       = "default"
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
      "sudo systemctl reboot sonarqube.service"
    ]
  }
}