output "ghost_image_sha" {
  value = docker_image.ghost_image.latest
}

output "ghost_container_id" {
  value = docker_container.ghost_container.id
}