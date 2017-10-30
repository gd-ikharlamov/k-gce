provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# resource "docker_image" "sonar" {
#     name = "k-gce/sonar"
#     keep_locally = true
# }

resource "docker_container" "sonar" {
    image = "k-gce/sonar:latest"
    name = "sonar"
}
