terraform {
required_providers {
  docker = {
    source = "kreuzwerker/docker"
    version = "~> 3.0.1"
  }
}
}
provider "docker" {}

resource "docker_image" "nginx" {
  name          = "nginx"
  keep_locally  = true
}

resource "docker_image" "python" {
  name          = "python"
  keep_locally = true
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.image_id
    name  = "nginxtest"  

    ports {
        internal = 80
        external = 8000
    }
}
resource "docker_container" "python" {
    image = docker_image.python.image_id
    name  = "pythontest"
}