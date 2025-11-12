job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    task "hello" {
      driver = "docker"

      config {
        image = "devops-final:latest" # change to <dockerhub-user>/devops-final:latest if pushed to Docker Hub
        network_mode = "bridge"
      }

      resources {
        cpu    = 100
        memory = 128
      }

      logs {
        max_files     = 5
        max_file_size = 10
      }
    }
  }
}
