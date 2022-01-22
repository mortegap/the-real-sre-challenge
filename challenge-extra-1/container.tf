terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "docker_image" "challenge-extra-1" {
  name = "challenge-extra-1:latest"

  build {
    path = "../challenge-4"
  }
}

resource "docker_container" "challenge-extra-1" {
  name  = "challenge_extra_1"
  image = "challenge-extra-1:latest"

  ports {
    internal = 8083
    external = 83
   }
}
