terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.13"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "skybox-app" {
  name = "skybox-app"
  build {
    path = "load-balancing/app1"
    tag  = ["skybox-app:latest"]
  }
}

resource "docker_network" "private_network" {
  name       = "skybox-net"
  attachable = true
  ipam_config {
    subnet  = "10.0.1.0/24"
    gateway = "10.0.1.254"
  }
}

resource "docker_container" "skybox-app" {
  image = "skybox-app:latest"
  name  = "skybox-app${count.index + 1}" 
  restart = "always"
  count = length(local.list_of_app)
  networks_advanced {
    name = "${docker_network.private_network.name}"
    ipv4_address ="10.0.1.${count.index + 1}"
  }
  ports {
    internal = 5000
  }
}

resource "docker_image" "skybox-haproxy" {
  name = "skybox-haproxy"
  build {
    path = "load-balancing/haproxy"
    tag  = ["skybox-haproxy:latest"]
  }
}


resource "docker_container" "skybox-haproxy" {
  image = "skybox-haproxy:latest"
  name  = "skybox-haproxy"
  restart = "always"
  networks_advanced {
    name = "${docker_network.private_network.name}"
    ipv4_address ="10.0.1.10"
  }

  ports {
    internal = 80
    external = 80
  }
}


 