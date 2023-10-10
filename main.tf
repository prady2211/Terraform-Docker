terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "insuranceapp" {

  name         = "prady2211/insuranceapp:latest"
  keep_locally = false
}

resource "docker_container" "insuranceapp" {

  image = docker_image.insuranceapp.latest
  name  = "insuranceapp-tf"
  ports {

    internal = 8501
    external = 80
  }
}

