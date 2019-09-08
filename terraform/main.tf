module "docker" {
    source = "./docker"
    
    image = "ghost:2-alpine"
    app_name =  "ghost_blog"
    ports = {
        internal = 2368
        external = 80
    }
}
