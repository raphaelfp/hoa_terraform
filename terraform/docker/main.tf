resource "docker_image" "ghost_image" {
  name = var.image
}

resource "docker_container" "ghost_container" {
  name  = var.app_name
  image = docker_image.ghost_image.latest
  
  ports {
      internal = var.ports.internal
      external = var.ports.external
  }
}