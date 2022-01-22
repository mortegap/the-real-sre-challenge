resource "docker_container" "challenge-extra-1" {
  name  = "challenge_extra_1"

  build {
    path = "../challenge-4/"
  }

  ports {
    internal = 8083
    external = 83
   }
}
