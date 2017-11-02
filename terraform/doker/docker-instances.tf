resource "docker_container" "mysql" {
    image = "k-gce/mysql:latest"
    name = "mysql"
    memory = "1024"
    networks = ["${docker_network.private_network.name}"]
}

resource "docker_container" "sonar" {
    image = "k-gce/sonar:latest"
    name = "sonar"
    networks = ["${docker_network.private_network.name}"]
    ports = {
        internal = "9000"
        external = "9000"
    }
    depends_on = ["docker_container.mysql"]
}
