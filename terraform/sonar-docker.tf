provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "private_network" {
  name = "k-net"
}

resource "docker_container" "mariadb" {
    image = "k-gce/mariadb:latest"
    name = "mariadb"
    memory = "1024"
    networks = ["k-net"]
}

resource "docker_container" "sonar" {
    image = "k-gce/sonar:latest"
    name = "sonar"
    networks = ["k-net"]
    ports = {
        internal = "9000"
        external = "9000"
    }
}
