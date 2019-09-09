variable "image" {
  default = "ghost:2-alpine"
}

variable "app_name" {
  default = "ghost_blog"
}

variable "ports" {
  default = {
    internal = 2368
    external = 80
  }
}